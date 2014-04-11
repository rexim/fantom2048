using build;

class Build : BuildPod {
    new make() {
        podName = "fantom2048";
        summary = "2048 game written in Fantom";
        depends = ["sys 1.0+"];
        srcDirs = [`fan/`, `test/`];
    }
}