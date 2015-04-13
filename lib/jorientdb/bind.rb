require 'bind-it'
    
module JOrientDB 
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
        ['ODatabaseDocumentPool',     "#{CORE}.db.document"],
        ['ODatabaseDocumentTxPooled', "#{CORE}.db.document"],

        #--- Database record class
        ['ORecordTrackedList', "#{CORE}.db.record", 'RecordList'],
        ['ORecordTrackedSet',  "#{CORE}.db.record", 'RecordSet'],

        #--- Sql
        ['OCommandSQL',    "#{CORE}.sql"],
        ['OSQLSynchQuery', "#{CORE}.sql.query"],

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

#    INDEX_TYPES   = OClass.INDEX_TYPE.constants.inject({ }) { |h, s| h[s.downcase.to_sym] = IndexType.const_get s; h }
#    STORAGE_TYPES = []#ClusterType.constants.inject({ }) { |h, s| h[s.downcase.to_sym] = ClusterType.const_get(s).to_s; h }
#    FIELD_TYPES   = SchemaType.constants.inject({ }) { |h, s| h[s.downcase.to_sym] = SchemaType.const_get s; h }
#    {
#      :bool          => "BOOLEAN",
#      :double        => "BYTE",
#      :datetime      => "DATE",
#      :decimal       => "FLOAT",
#      :embedded_list => "EMBEDDEDLIST",
#      :list          => "EMBEDDEDLIST",
#      :embedded_map  => "EMBEDDEDMAP",
#      :map           => "EMBEDDEDMAP",
#      :embedded_set  => "EMBEDDEDSET",
#      :set           => "EMBEDDEDSET",
#      :int           => "INTEGER",
#      :link_list     => "LINKLIST",
#      :link_map      => "LINKMAP",
#      :link_set      => "LINKSET",
#    }.map do |k,v|
#      FIELD_TYPES[k] = SchemaType.const_get(v) unless FIELD_TYPES.key?(k)
#    end