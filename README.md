# Run SonarQube from a PR or a local zip

In the following, please find small scripts that you might use to build a docker image and run SonarQube based on the changes made on a PR, or on a locally built SonarQube zip. 

## Tools required

Docker

## PR

### Precondition

- Your PR has passed all checks successfully.
- You don't have any application running on port 9000 (i.e., http://localhost:9000/ can't be reached)

### How to run it

1. Get the SONARQUBE_VERSION. Currently the version is `10.2.0`
2. Get the BUILD_NUMBER of your successful PR build (e.g., this infomation is available on Cirrus in the `promote` task log)
3. Run the script typing the following command in the terminal from the `pr` directory
```
sh SQFromPR.sh SONARQUBE_VERSION BUILD_NUMBER
```
4. After the log displays that "app[][o.s.a.SchedulerImpl] SonarQube is operational", you open the browser and access SonarQube at http://localhost:9000/

### Example

Assuming that your PR has successfully passed, the SQ version is `10.1.0` and `69619` is your build number, you should run `sh SQFromPR.sh 10.1.0 69619`

## Local zip

### Precondition

- You have a sonarqube zip built locally or downloaded, and copied it in the `local` directory
- You don't have any application running on port 9000 (i.e., http://localhost:9000/ can't be reached)

### How to run it

1. Get the SONARQUBE_VERSION of the zip.
2. Get the SONARQUBE_ZIP file name.
3. Run the script typing the following command in the terminal from the `local` directory
```
sh SQFromLocal.sh SONARQUBE_VERSION SONARQUBE_ZIP
```
4. After the log displays that "app[][o.s.a.SchedulerImpl] SonarQube is operational", you open the browser and access SonarQube at http://localhost:9000/

### Example

Assuming that you built locally a zip called sonarqube-enterprise-10.1-SNAPSHOT.zip, you should run `sh SQFromLocal.sh 10.1-SNAPSHOT sonarqube-enterprise-10.1-SNAPSHOT.zip`

## How to stop the instance

Just press CTRL+C to stop SonarQube ("SonarQube is stopped")

## Troubleshoot

If you encounter issues when running the image on a Windows OS, make sure the `entrypoint.sh` file has LF line endings and not CRLF.
