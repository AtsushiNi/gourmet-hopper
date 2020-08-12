# Application run on VScode #
git clone xxx
gradle eclipse
gradle build

brew mysql install
mysql -u root -e "CREATE DATABASE IF NOT EXISTS java_training"
mysql -u root -D java_training < java_training_ddl.sql
