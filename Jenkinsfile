pipeline {
    agent any

    stages {
    //アプリケーションビルド
        stage("Build") {
            steps {
                sh "chmod +x ./gradlew"
                sh "./gradlew war"
            }
        }
        
        //アプリケーションの実行
        stage("App Deploy") {
          	when{
        		expression {currentBuild.currentResult == 'SUCCESS'}
        	}

            steps {
                sh "cp -ip ./build/libs/java-training*.war /usr/lib/payara5/glassfish/domains/domain1/autodeploy/"
            }
        }
        
//      stage("Data Setup") {
//          when{
//              expression {currentBuild.currentResult == 'SUCCESS'}
//          }
//
//          steps {
//              sh "sudo -u ec2-user scp -i javatraining_rsa java_training_ddl.sql ec2-user@3.112.209.238:~/"
//              sh "ssh -i javatraining_rsa ec2-user@3.112.209.238 mysql -uroot -p password < java_training_ddl.sql"
//          }
//      }
    }
}
