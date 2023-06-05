# Run SonarQube from a PR

In the following, please find the small script that you might use to run SonarQube based on the changes made on a PR. 

## Tools required

Docker

## Precondition

- Your PR has passed all checks successfully.
- You don't have any application running on port 9000 (i.e., http://localhost:9000/ can't be reached)

## How to run it

1. Get the SONARQUBE_VERSION. Currently the version is `10.1.0`
1. Get the BUILD_NUMBER of your successful PR build (e.g., this infomation is available on Cirrus in the `promote` task log)
2. Run the script typing the following command in the terminal

```
sh SQFromPR.sh SONARQUBE_VERSION BUILD_NUMBER
```
3. After the log displays that "app[][o.s.a.SchedulerImpl] SonarQube is operational", you open the browser and access SonarQube at http://localhost:9000/

## How to stop the instance

Just press CTRL+C to stop SonarQube ("SonarQube is stopped")

## Examples

Assuming that your PR has successfully passed, the SQ version is `10.1.0` and `69619` is your build number, you should run `sh SQFromPR.sh 10.1.0 69619`