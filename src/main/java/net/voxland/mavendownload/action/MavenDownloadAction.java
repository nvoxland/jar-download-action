package net.voxland.mavendownload.action;

import org.apache.maven.cli.MavenCli;

public class MavenDownloadAction {

    public static void main(String[] args) {
        System.out.println("hi!");

//        new ProcessArtifactItemsRequest( false, false, false, false);
//        ArtifactItem item = new ArtifactItem();
//        item.setGroupId();
//        MavenArtifactResolver resolver = Class.forName("org.apache.maven.shared.transfer.artifact.resolve.internal.Maven31ArtifactResolver").getConstructor().newInstance();


        System.setProperty("maven.multiModuleProjectDirectory", "maven");

        MavenCli cli = new MavenCli();
        int result = cli.doMain(new String[]{"compile"},
                ".",
                System.out, System.out);
        System.out.println("result: " + result);

    }
}
