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
        
      stage("Data Setup") {
          when{
              expression {currentBuild.currentResult == 'SUCCESS'}
          }

          steps {
              sh "mysql -uroot -p Muit@123 javatraining < javatraining.sql"
          }
      }
    }
}
