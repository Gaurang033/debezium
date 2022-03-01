CREATE TABLE `dataframework.debezium.poc_postgres`
(
  payload STRUCT<
                    ts_ms INT64, 
                    before STRUCT<name STRING, id INT64>, 
                    after STRUCT<name STRING, id INT64>
                    source STRUCT<
                                    lsn INT64, 
                                    db STRING, 
                                    snapshot BOOL, 
                                    ts_ms INT64, 
                                    name STRING, 
                                    txId INT64, 
                                    sequence STRING, 
                                    connector STRING, 
                                    table STRING, 
                                    schema STRING, 
                                    version STRING
                                >, 
                    op STRING
                >,
  schema STRUCT<
                name STRING, 
                optional BOOL, 
                fields ARRAY<STRUCT<
                                    name STRING, 
                                    optional BOOL, 
                                    fields ARRAY<STRUCT<
                                                        version INT64, 
                                                        optional BOOL, 
                                                        name STRING, 
                                                        `default` STRING, 
                                                        parameters STRUCT<allowed STRING>, 
                                                        field STRING, 
                                                        type STRING
                                                    >
                                                >, 
                                    field STRING, 
                                    type STRING
                                >
                >, 
                type STRING
            >
);


	
CREATE TABLE `dataframework.debezium.sample`
(
  payload STRUCT<
                    transaction STRING, 
                    ts_ms INT64, 
                    before STRUCT<name STRING, id INT64>, 
                    after STRUCT<name STRING, id INT64>, 
                    op STRING, 
                    source STRUCT<
                                    thread STRING, 
                                    sequence STRING, 
                                    query STRING, 
                                    row INT64, 
                                    file STRING, 
                                    pos INT64, 
                                    name STRING, 
                                    server_id INT64, 
                                    db STRING, 
                                    snapshot BOOL, 
                                    version STRING, 
                                    table STRING, 
                                    ts_ms INT64, 
                                    gtid STRING, 
                                    connector STRING
                                >
                >,
  schema STRUCT<
                name STRING, 
                optional BOOL, 
                fields ARRAY<STRUCT<
                                    name STRING, 
                                    optional BOOL, 
                                    fields ARRAY<STRUCT<
                                        `default` BOOL, 
                                        version INT64, 
                                        name STRING, 
                                        optional BOOL, 
                                        parameters STRUCT<allowed STRING>, 
                                        field STRING, 
                                        type STRING
                                    >>, 
                                    field STRING, 
                                    type STRING>>, 
                type STRING
            >
);