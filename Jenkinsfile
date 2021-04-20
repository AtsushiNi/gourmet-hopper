pipeline {
    agent any

    environment {
        projectName = "java-training"
        tagName = "latest"
        execDir = "/tmp"
        appName = "spring-rs-person"
        studentName = "student77"
        port = "8080"
        DockerRegistry = "18.179.82.228:50443"
    }

    stages {
        stage("BUILD") {
            steps {
                script {
                    if(isUnix()) {
                        sh "chmod +x ./${projectName}/gradlew"
                    }
                }
                gradlew "-p ${projectName} war"
            }
        }

        stage("Docker Build") {
          	when{
        		expression {currentBuild.currentResult == 'SUCCESS'}
        	}

            steps {
                script {

                    sh "docker stop \$(docker ps -q) | echo ''"
                    sh "docker rm ${appName} | echo ''"
                    sh "docker build -t javatraining-99:latest ."
//                    sh "docker build -t ${appName}-${studentName}:${tagName} \
//                        --build-arg appName=${appName} \
//                        ./${projectName}" // 最後のパラメータはDockerfileのあるディレクトリ
                    // sh "docker system prune --force"
                }
            }
        }

        stage("Docker Run") {
          	when{
        		expression {currentBuild.currentResult == 'SUCCESS'}
        	}

            steps {
                script {
                     sh "docker run --name javatraining-99 -p 8080:8080 -p 4848:4848 -p 8009:8009 -p 8181:8181 -d javatraining-99:latest"
                }
            }
        }

        stage("Make ConnectionPool") {
                  	when{
                		expression {currentBuild.currentResult == 'SUCCESS'}
                	}

            steps {
                script {
                sh "asadmin --user admin --passwordfile passwordFile create-jdbc-connection-pool --validateAtmostOncePeriodInSeconds=0 --sqlTraceListeners=fish.payara.jdbc.SilentSqlTraceListener --statementLeakReclaim=false --ping=false --maxWaitTimeInMillis=60000 --logjdbccalls=false --wrapJdbcObjects=true --connectionValidationMethod=table --steadyPoolSize=8 --idleTimeoutInSeconds=300 --maxConnectionUsageCount=0 --matchConnections=false --connectionCreationRetryIntervalInSeconds=10 --associateWithThread=false --isConnectionValidationRequired=false --connectionLeakReclaim=false --datasourceClassname=com.mysql.cj.jdbc.MysqlDataSource --connectionCreationRetryAttempts=0 --statementCacheSize=0 --resType=javax.sql.DataSource --statementLeakTimeoutInSeconds=0 --failAllConnections=false --statementTimeoutInSeconds=-1 --lazyConnectionEnlistment=false --pooling=true --poolResizeQuantity=2 --allowNonComponentCallers=false --connectionLeakTimeoutInSeconds=0 --isIsolationLevelGuaranteed=true --maxPoolSize=32 --nonTransactionalConnections=false --lazyConnectionAssociation=false mysql-pool"
                sh "asadmin --user admin --passwordfile passwordFile set resources.jdbc-connection-pool.mysql-pool.property.SelfDestructOnPingSecondsLifetime=0 resources.jdbc-connection-pool.mysql-pool.property.UseUsageAdvisor=false resources.jdbc-connection-pool.mysql-pool.property.FallbackToSystemKeyStore=true resources.jdbc-connection-pool.mysql-pool.property.HaEnableJMX=false resources.jdbc-connection-pool.mysql-pool.property.AllowSlaveDownConnections=false resources.jdbc-connection-pool.mysql-pool.property.LoadBalanceBlacklistTimeout=0 resources.jdbc-connection-pool.mysql-pool.property.QueryTimeoutKillsConnection=false resources.jdbc-connection-pool.mysql-pool.property.CacheServerConfiguration=false resources.jdbc-connection-pool.mysql-pool.property.UseCursorFetch=false resources.jdbc-connection-pool.mysql-pool.property.JdbcCompliantTruncation=true resources.jdbc-connection-pool.mysql-pool.property.UseOnlyServerErrorMessages=true resources.jdbc-connection-pool.mysql-pool.property.AllowPublicKeyRetrieval=false resources.jdbc-connection-pool.mysql-pool.property.DefaultAuthenticationPlugin=com.mysql.cj.protocol.a.authentication.MysqlNativePasswordPlugin resources.jdbc-connection-pool.mysql-pool.property.DontTrackOpenResources=false resources.jdbc-connection-pool.mysql-pool.property.UseInformationSchema=false resources.jdbc-connection-pool.mysql-pool.property.UseNanosForElapsedTime=false resources.jdbc-connection-pool.mysql-pool.property.UseCompression=false resources.jdbc-connection-pool.mysql-pool.property.EnableEscapeProcessing=true resources.jdbc-connection-pool.mysql-pool.property.AutoDeserialize=false resources.jdbc-connection-pool.mysql-pool.property.TcpRcvBuf=0 resources.jdbc-connection-pool.mysql-pool.property.AutoSlowLog=true resources.jdbc-connection-pool.mysql-pool.property.IgnoreNonTxTables=false resources.jdbc-connection-pool.mysql-pool.property.AllowNanAndInf=false resources.jdbc-connection-pool.mysql-pool.property.TcpSndBuf=0 resources.jdbc-connection-pool.mysql-pool.property.ContinueBatchOnError=true resources.jdbc-connection-pool.mysql-pool.property.Logger=com.mysql.cj.log.StandardLogger resources.jdbc-connection-pool.mysql-pool.property.MaxAllowedPacket=65535 resources.jdbc-connection-pool.mysql-pool.property.PrepStmtCacheSqlLimit=256 resources.jdbc-connection-pool.mysql-pool.property.AllowMultiQueries=false resources.jdbc-connection-pool.mysql-pool.property.InitialTimeout=2 resources.jdbc-connection-pool.mysql-pool.property.PreserveInstants=true resources.jdbc-connection-pool.mysql-pool.property.DnsSrv=false resources.jdbc-connection-pool.mysql-pool.property.AutoClosePStmtStreams=false resources.jdbc-connection-pool.mysql-pool.property.UseServerPrepStmts=false resources.jdbc-connection-pool.mysql-pool.property.IncludeThreadNamesAsStatementComment=false resources.jdbc-connection-pool.mysql-pool.property.CreateDatabaseIfNotExist=false resources.jdbc-connection-pool.mysql-pool.property.RollbackOnPooledClose=true resources.jdbc-connection-pool.mysql-pool.property.LoadBalanceValidateConnectionOnSwapServer=false resources.jdbc-connection-pool.mysql-pool.property.CompensateOnDuplicateKeyUpdateCounts=false resources.jdbc-connection-pool.mysql-pool.property.EnablePacketDebug=false resources.jdbc-connection-pool.mysql-pool.property.PadCharsWithSpace=false resources.jdbc-connection-pool.mysql-pool.property.NoAccessToProcedureBodies=false resources.jdbc-connection-pool.mysql-pool.property.ClientCertificateKeyStoreType=JKS resources.jdbc-connection-pool.mysql-pool.property.Port=3306 resources.jdbc-connection-pool.mysql-pool.property.ClientInfoProvider=com.mysql.cj.jdbc.CommentClientInfoProvider resources.jdbc-connection-pool.mysql-pool.property.CachePrepStmts=false resources.jdbc-connection-pool.mysql-pool.property.ProfileSQL=false resources.jdbc-connection-pool.mysql-pool.property.MaxQuerySizeToLog=2048 resources.jdbc-connection-pool.mysql-pool.property.LoadBalanceHostRemovalGracePeriod=15000 resources.jdbc-connection-pool.mysql-pool.property.TreatUtilDateAsTimestamp=true resources.jdbc-connection-pool.mysql-pool.property.DatabaseName=javatraining resources.jdbc-connection-pool.mysql-pool.property.UseSSL=false resources.jdbc-connection-pool.mysql-pool.property.DisconnectOnExpiredPasswords=true resources.jdbc-connection-pool.mysql-pool.property.DontCheckOnDuplicateKeyUpdateInSQL=false resources.jdbc-connection-pool.mysql-pool.property.TrustCertificateKeyStoreType=JKS resources.jdbc-connection-pool.mysql-pool.property.MaxRows=-1 resources.jdbc-connection-pool.mysql-pool.property.SlowQueryThresholdMillis=2000 resources.jdbc-connection-pool.mysql-pool.property.ResultSetSizeThreshold=100 resources.jdbc-connection-pool.mysql-pool.property.TransformedBitIsBoolean=false resources.jdbc-connection-pool.mysql-pool.property.Pedantic=false resources.jdbc-connection-pool.mysql-pool.property.ServerTimezone=Asia/Tokyo resources.jdbc-connection-pool.mysql-pool.property.SocksProxyPort=1080 resources.jdbc-connection-pool.mysql-pool.property.EnableQueryTimeouts=true resources.jdbc-connection-pool.mysql-pool.property.DatabaseTerm=CATALOG resources.jdbc-connection-pool.mysql-pool.property.LogXaCommands=false resources.jdbc-connection-pool.mysql-pool.property.PrepStmtCacheSize=25 resources.jdbc-connection-pool.mysql-pool.property.Password=Muit@123 resources.jdbc-connection-pool.mysql-pool.property.SelfDestructOnPingMaxOperations=0 resources.jdbc-connection-pool.mysql-pool.property.ZeroDateTimeBehavior=EXCEPTION resources.jdbc-connection-pool.mysql-pool.property.CallableStmtCacheSize=100 resources.jdbc-connection-pool.mysql-pool.property.SecondsBeforeRetryMaster=30 resources.jdbc-connection-pool.mysql-pool.property.EmulateLocators=false resources.jdbc-connection-pool.mysql-pool.property.LoginTimeout=0 resources.jdbc-connection-pool.mysql-pool.property.GatherPerfMetrics=false resources.jdbc-connection-pool.mysql-pool.property.RetriesAllDown=120 resources.jdbc-connection-pool.mysql-pool.property.DetectCustomCollations=false resources.jdbc-connection-pool.mysql-pool.property.NoDatetimeStringSync=false resources.jdbc-connection-pool.mysql-pool.property.LargeRowSizeThreshold=2048 resources.jdbc-connection-pool.mysql-pool.property.LoadBalanceAutoCommitStatementThreshold=0 resources.jdbc-connection-pool.mysql-pool.property.UltraDevHack=false resources.jdbc-connection-pool.mysql-pool.property.StrictUpdates=true resources.jdbc-connection-pool.mysql-pool.property.EmptyStringsConvertToZero=true resources.jdbc-connection-pool.mysql-pool.property.UseLocalSessionState=false resources.jdbc-connection-pool.mysql-pool.property.HaLoadBalanceStrategy=random resources.jdbc-connection-pool.mysql-pool.property.PopulateInsertRowWithDefaultValues=false resources.jdbc-connection-pool.mysql-pool.property.ProfilerEventHandler=com.mysql.cj.log.LoggingProfilerEventHandler resources.jdbc-connection-pool.mysql-pool.property.UseStreamLengthsInPrepStmts=true resources.jdbc-connection-pool.mysql-pool.property.UseOldAliasMetadataBehavior=false resources.jdbc-connection-pool.mysql-pool.property.ReadOnlyPropagatesToServer=true resources.jdbc-connection-pool.mysql-pool.property.SocketFactory=com.mysql.cj.protocol.StandardSocketFactory resources.jdbc-connection-pool.mysql-pool.property.AutoReconnect=false resources.jdbc-connection-pool.mysql-pool.property.MaxReconnects=3 resources.jdbc-connection-pool.mysql-pool.property.ReportMetricsIntervalMillis=30000 resources.jdbc-connection-pool.mysql-pool.property.BlobsAreStrings=false resources.jdbc-connection-pool.mysql-pool.property.SendFractionalSeconds=true resources.jdbc-connection-pool.mysql-pool.property.CacheResultSetMetadata=false resources.jdbc-connection-pool.mysql-pool.property.Paranoid=false resources.jdbc-connection-pool.mysql-pool.property.AllowUrlInLocalInfile=false resources.jdbc-connection-pool.mysql-pool.property.EmulateUnsupportedPstmts=true resources.jdbc-connection-pool.mysql-pool.property.ReconnectAtTxEnd=false resources.jdbc-connection-pool.mysql-pool.property.RequireSSL=false resources.jdbc-connection-pool.mysql-pool.property.UseHostsInPrivileges=true resources.jdbc-connection-pool.mysql-pool.property.UseReadAheadInput=true resources.jdbc-connection-pool.mysql-pool.property.ForceConnectionTimeZoneToSession=false resources.jdbc-connection-pool.mysql-pool.property.ParseInfoCacheFactory=com.mysql.cj.PerConnectionLRUFactory resources.jdbc-connection-pool.mysql-pool.property.DefaultFetchSize=0 resources.jdbc-connection-pool.mysql-pool.property.URL=jdbc:mysql://3.112.209.238:3306/javatraining resources.jdbc-connection-pool.mysql-pool.property.Url=jdbc:mysql://3.112.209.238:3306/javatraining resources.jdbc-connection-pool.mysql-pool.property.AllowMasterDownConnections=false resources.jdbc-connection-pool.mysql-pool.property.CacheDefaultTimezone=true resources.jdbc-connection-pool.mysql-pool.property.QueriesBeforeRetryMaster=50 resources.jdbc-connection-pool.mysql-pool.property.SslMode=DISABLED resources.jdbc-connection-pool.mysql-pool.property.FunctionsNeverReturnBlobs=false resources.jdbc-connection-pool.mysql-pool.property.DumpQueriesOnException=false resources.jdbc-connection-pool.mysql-pool.property.LoadBalanceExceptionChecker=com.mysql.cj.jdbc.ha.StandardLoadBalanceExceptionChecker resources.jdbc-connection-pool.mysql-pool.property.VerifyServerCertificate=false resources.jdbc-connection-pool.mysql-pool.property.NetTimeoutForStreamingResults=600 resources.jdbc-connection-pool.mysql-pool.property.ProcessEscapeCodesForPrepStmts=true resources.jdbc-connection-pool.mysql-pool.property.UseAffectedRows=false resources.jdbc-connection-pool.mysql-pool.property.TinyInt1isBit=true resources.jdbc-connection-pool.mysql-pool.property.MetadataCacheSize=50 resources.jdbc-connection-pool.mysql-pool.property.RewriteBatchedStatements=false resources.jdbc-connection-pool.mysql-pool.property.GetProceduresReturnsFunctions=true resources.jdbc-connection-pool.mysql-pool.property.ServerConfigCacheFactory=com.mysql.cj.util.PerVmServerConfigCacheFactory resources.jdbc-connection-pool.mysql-pool.property.TcpTrafficClass=0 resources.jdbc-connection-pool.mysql-pool.property.AutoGenerateTestcaseScript=false resources.jdbc-connection-pool.mysql-pool.property.CacheCallableStmts=false resources.jdbc-connection-pool.mysql-pool.property.FailOverReadOnly=true resources.jdbc-connection-pool.mysql-pool.property.LoadBalancePingTimeout=0 resources.jdbc-connection-pool.mysql-pool.property.LocatorFetchBufferSize=1048576 resources.jdbc-connection-pool.mysql-pool.property.OverrideSupportsIntegrityEnhancementFacility=false resources.jdbc-connection-pool.mysql-pool.property.HoldResultsOpenOverStatementClose=false resources.jdbc-connection-pool.mysql-pool.property.InteractiveClient=false resources.jdbc-connection-pool.mysql-pool.property.PortNumber=3306 resources.jdbc-connection-pool.mysql-pool.property.LogSlowQueries=false resources.jdbc-connection-pool.mysql-pool.property.IncludeThreadDumpInDeadlockExceptions=false resources.jdbc-connection-pool.mysql-pool.property.User=root resources.jdbc-connection-pool.mysql-pool.property.SlowQueryThresholdNanos=0 resources.jdbc-connection-pool.mysql-pool.property.IncludeInnodbStatusInDeadlockExceptions=false resources.jdbc-connection-pool.mysql-pool.property.MaintainTimeStats=true resources.jdbc-connection-pool.mysql-pool.property.PinGlobalTxToPhysicalConnection=false resources.jdbc-connection-pool.mysql-pool.property.TcpNoDelay=true resources.jdbc-connection-pool.mysql-pool.property.TraceProtocol=false resources.jdbc-connection-pool.mysql-pool.property.AlwaysSendSetIsolation=true resources.jdbc-connection-pool.mysql-pool.property.FallbackToSystemTrustStore=true resources.jdbc-connection-pool.mysql-pool.property.NullCatalogMeansCurrent=false resources.jdbc-connection-pool.mysql-pool.property.YearIsDateType=true resources.jdbc-connection-pool.mysql-pool.property.SendFractionalSecondsForTime=true resources.jdbc-connection-pool.mysql-pool.property.SocketTimeout=0 resources.jdbc-connection-pool.mysql-pool.property.UseLocalTransactionState=false resources.jdbc-connection-pool.mysql-pool.property.GenerateSimpleParameterMetadata=false resources.jdbc-connection-pool.mysql-pool.property.ExplainSlowQueries=false resources.jdbc-connection-pool.mysql-pool.property.UseColumnNamesInFindColumn=false resources.jdbc-connection-pool.mysql-pool.property.ConnectTimeout=0 resources.jdbc-connection-pool.mysql-pool.property.ElideSetAutoCommits=false resources.jdbc-connection-pool.mysql-pool.property.PacketDebugBufferSize=20 resources.jdbc-connection-pool.mysql-pool.property.BlobSendChunkSize=1048576 resources.jdbc-connection-pool.mysql-pool.property.UseUnbufferedInput=true resources.jdbc-connection-pool.mysql-pool.property.AllowLoadLocalInfile=false resources.jdbc-connection-pool.mysql-pool.property.ReadFromMasterWhenNoSlaves=false resources.jdbc-connection-pool.mysql-pool.property.AutoReconnectForPools=false resources.jdbc-connection-pool.mysql-pool.property.TcpKeepAlive=true resources.jdbc-connection-pool.mysql-pool.property.ClobberStreamingResults=false"
                sh "asadmin --user admin --passwordfile passwordFile create-jdbc-resource --enabled=true --poolName=mysql-pool --target=domain jdbc/tx"
                sh "asadmin --user admin --passwordfile passwordFile create-resource-ref --enabled=true --target=server jdbc/tx"
                }
            }
        }
        stage("Data Setup") {
                    when{
                        expression {currentBuild.currentResult == 'SUCCESS'}
                    }

            steps {
                script {
                sh "mysql -u username -h 3.112.209.238 -p -D javatraining < java_training_ddl.sql"
                }
            }
        }
    }
}

// Gradlewコマンドを実行する
def gradlew(command) {
    sh "./${projectName}/gradlew ${command}"
}
