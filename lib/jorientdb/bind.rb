
require 'bind-it'

module JOrientdb 
    extend BindIt::Binding

    CORE = 'com.orientechnologies.orient.core'
    CLIENT = 'com.orientechnologies.orient.client'
    SERVER = 'com.orientechnologies.orient.server'
    BLUEPRINTS = 'com.tinkerpop.blueprints'

    # Arguments to use when initializing the JVM.
    self.jvm_args =  ['-Xms512M', '-Xmx1024M']

    # If set, JVM output is redirected to file.
    self.log_file = nil

    # The path in which to look for JAR files.
    self.jar_path = "#{ ::File.expand_path("../..", __FILE__) }/jars/"

    # Default JAR files to load.
    self.default_jars = [ *(Dir["#{self.jar_path }**/*.jar"].collect{|path| path.gsub(self.jar_path, '')}) ]

    # Default namespace to use when loading classes.
    self.default_namespace = 'com.orientechnologies.orient'

    # Default classes to load under MyBindings.
    # Shown are the three different ways of adding
    # a class to the default list.
    self.default_classes = [
        #--- Storage class
        ['OStorage',      "#{CORE}.storage", 'OStorage'],

        #--- Database document class
        ['ODatabaseDocumentTx',       "#{CORE}.db.document"],
        ['OPartitionedDatabasePool',     "#{CORE}.db"],

        #--- Database record class
        ['ORecordTrackedList', "#{CORE}.db.record", 'RecordList'],
        ['ORecordTrackedSet',  "#{CORE}.db.record", 'RecordSet'],
        ['OTrackedList',  "#{CORE}.db.record"],
        ['ORecordLazyList',  "#{CORE}.db.record"],
        ['OTrackedMap',  "#{CORE}.db.record"],
        ['ORecordLazyMap',  "#{CORE}.db.record"],

        ['OIdentifiable',  "#{CORE}.db.record"],
		
        #--- Sql
        ['OCommandSQL',    "#{CORE}.sql"],
        ['OSQLSynchQuery', "#{CORE}.sql.query"],
        ['OSQLQuery',      "#{CORE}.sql.query"],

        #--- Schema class
        ['OClass',        "#{CORE}.metadata.schema"],
        ['OClassImpl',    "#{CORE}.metadata.schema"],
        ['OPropertyImpl', "#{CORE}.metadata.schema"],
        ['OSchema',       "#{CORE}.metadata.schema"],
        ['OSchemaProxy',  "#{CORE}.metadata.schema"],
        ['OType',         "#{CORE}.metadata.schema"],

        #--- Others
        ['OUser', "#{CORE}.metadata.security"],
        ['ODocument', "#{CORE}.record.impl"],
        ['ORecordBytes',  "#{CORE}.record.impl"],
        ['OTraverse', "#{CORE}.command.traverse"],
        ['OStorageRemote', "#{CLIENT}.remote"],

        #--- Gremlin
        ['GremlinPipeline', "com.tinkerpop.gremlin.java"],

        ['OrientGraph', "#{BLUEPRINTS}.impls.orient"],
        ['TransactionalGraph', "com.tinkerpop.blueprints"]

      ]

    # Load the default JARs and classes.
    self.bind
end