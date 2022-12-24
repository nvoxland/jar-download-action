# Jar Download GitHub Action

The `jar-download` action allows you to easily download Java jar files in GitHub Actions -- including dependencies! 

While Maven Central and other repositories do allow simple `curl` or `wget` downloads, it's up to you to manage the sometimes-complex URL. 
Plus, jars often rely on other jars leads to an overly complex game of "what else do I have to download?" a.k.a "wget-a-mole"

This action allows you to simply specify the "coordinates" of the library, and it will download everything you need.

## Finding Coordinates

Maven-compatible repositories such as [Maven Central](https://mvnrepository.com/) identify each library with three pieces of information:
1. The "Group ID" which tends to be unique to the organization or person who published the library
2. The "Artifact ID" which identifies the artifact within the group
3. The "Version" of the artifact.

Your package repository will tell you the groupId/artifactId and available versions. 

For example, [the AWS SDK for Java](https://mvnrepository.com/artifact/com.amazonaws/aws-java-sdk/1.12.370) page on Maven Central 
tells you the groupId is `com.amazonaws`, the artifactId is `aws-java-sdk` and the version is `1.12.370`. 

Sometimes, you will see the coordinates are listed as a colon-separated list of `groupId:artifactId:version` like `com.amazonaws:aws-java-sdk:1.12.370`

## Usage

 - `groupId`: The Group ID of the artifact to download **(required)**
 - `artifactId`: The Artifact ID of the artifact to download **(required)**
 - `version`: The version of the artifact to download **(required)**
 - `outputDirectory`: The directory to download all artifacts to. Will create the directory if it does not exist **(required)** 
 - `repository`: The URL of the Maven-compatible repository to download from. If not set, uses Maven Central.  

## Example Configuration

```yaml
steps:
- uses: actions/checkout@v3

- uses: nvoxland/jar-download-action@v1
  with:
    groupId: com.amazonaws
    artifactId: aws-java-sdk
    version: 1.12.370
    outputDirectory: app_libs

- run: ls -l app_libs
```

## License

The scripts and documentation in this project are released under the [Apache 2.0 License](LICENSE).

## Contributions

Pull requests and issue reports are always welcome!