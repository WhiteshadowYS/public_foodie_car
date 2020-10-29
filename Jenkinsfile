/* import shared library */
@Library('jenkins-shared-library')_

pipeline {
    agent any

    environment {
        PROJECT_FLUTTER_VERSION = "1.20.4";

        // Tokens
        DEBUG_BUILD_TOKEN = " -d";
        RELEASE_BUILD_TOKEN = " -r";
        IOS_BUILD_TOKEN = " -i";
        ALL_BUILD_TOKEN = " -a";

        // Telegram settings.
        TELEGRAM_CHAT_ID = "-1001365909620";
        TELEGRAM_BOT_TOKEN = "1338355868:AAErJSFD7kXmD1-a4cPFSG2m8bU6YKHdI3c";

        // Routes to .apk files.
        RELEASE_APK_ROUTE = "build/app/outputs/apk/release"
        DEBUG_APK_ROUTE = "build/app/outputs/apk/debug"

        // Routes to images
        SUCCESS_IMAGE = "https://miro.medium.com/max/668/1*FgdvdzDs64rW-1XJkQ-neA.jpeg"
        ERROR_IMAGE = "https://i.stack.imgur.com/9MxWX.png"
        ABORTED_IMAGE = "https://i0.wp.com/blog.mailon.com.ua/wp-content/uploads/2018/03/jenkins_secret.png"

        BUILD_STATUS_TEXT = "Build: ${env.BUILD_NUMBER} status - "
        BUILD_PAGE_TEXT = "\n\nBuild Page: ${env.BUILD_URL}"
        BUILD_LOGS_TEXT = "\n\nBuild logs: ${env.BUILD_URL}/consoleText\n\n\n"
        STATUS_SUCCESS = "SUCCESS!!!"
        STATUS_FAILED = "FAILED!!!"
        STATUS_UNSTABLE = "UNSTABLE!!!"
        STATUS_ABORTED = "ABORTED!!!"
    }

    stages {
        stage ('Checkout') {
            steps {
                checkout scm
            }
        }
        stage ('Steps Analysis') {
            steps {
               bitbucketStatusNotify(buildState: 'INPROGRESS')
               script {
                   env.FLUTTER_VERSION = sh (script: 'flutter --version', returnStdout: true).trim()
                   env.GIT_COMMIT_MSG = sh (script: 'git log -1 --pretty=%B ${GIT_COMMIT}', returnStdout: true).trim()

                   echo "Commit message: ${env.GIT_COMMIT_MSG}"
                   echo "Flutter version: ${env.FLUTTER_VERSION}"

                   env.IS_ANDROID_DEBUG_BUILD = stringContains(env.GIT_COMMIT_MSG, DEBUG_BUILD_TOKEN)
                   env.IS_ANDROID_RELEASE_BUILD = stringContains(env.GIT_COMMIT_MSG, RELEASE_BUILD_TOKEN)
                   env.IS_IOS_BUILD = stringContains(env.GIT_COMMIT_MSG, IOS_BUILD_TOKEN)
                   env.IS_ALL_BUILDS = stringContains(env.GIT_COMMIT_MSG, ALL_BUILD_TOKEN)
                   env.IS_FLUTTER_VERSION_CORRECT = stringContains(env.FLUTTER_VERSION, PROJECT_FLUTTER_VERSION)

                   echo "Is Flutter version correct: ${env.IS_FLUTTER_VERSION_CORRECT}"
                   echo "IOS: ${IS_IOS_BUILD}, Android debug: ${env.IS_ANDROID_DEBUG_BUILD}, Android release: ${IS_ANDROID_RELEASE_BUILD}"


                   def data = readYaml file: "pubspec.yaml"
                   env.PROJECT_VERSION = data.version
                   env.PROJECT_NAME = data.name
                   env.PROJECT_DESCRIPTION = data.description
                   echo "name: ${env.PROJECT_NAME}, description: ${env.PROJECT_DESCRIPTION}, version: ${env.PROJECT_VERSION}"
                   echo "${env.GIT_COMMIT}"

                   currentBuild.displayName = "${env.PROJECT_NAME}-v${env.PROJECT_VERSION} - Build number: ${env.BUILD_NUMBER}"
                   currentBuild.description = "${env.PROJECT_DESCRIPTION}\n${env.GIT_COMMIT_MSG}"

                   env.Build_text =
                   "\nProject Name: ${env.PROJECT_NAME}\nProject Version: ${env.PROJECT_VERSION}\nProject Description: ${env.PROJECT_DESCRIPTION}\n\nFlutter Version: $PROJECT_FLUTTER_VERSION\n\nCommit message: ${env.GIT_COMMIT_MSG}$BUILD_PAGE_TEXT$BUILD_LOGS_TEXT";

               }
            }
        }
        stage ('Flutter version') {
            when {
                expression {(env.IS_ANDROID_DEBUG_BUILD == "true" || env.IS_ANDROID_RELEASE_BUILD == "true" || env.IS_IOS_BUILD == "true"  || env.IS_ALL_BUILDS == "true") && IS_FLUTTER_VERSION_CORRECT == "false"}
            }
            steps {
                sh 'flutter version $PROJECT_FLUTTER_VERSION'
            }
        }
       stage ('Flutter pub get') {
            when {
                expression { env.IS_ANDROID_DEBUG_BUILD == "true" || env.IS_ANDROID_RELEASE_BUILD == "true" || env.IS_IOS_BUILD == "true" || env.IS_ALL_BUILDS == "true"}
            }

            steps {
                sh 'flutter clean && flutter pub get'
            }
        }
        stage ('Flutter Doctor') {
            when {
                expression { env.IS_ANDROID_DEBUG_BUILD == "true" || env.IS_ANDROID_RELEASE_BUILD == "true" || env.IS_IOS_BUILD == "true" || env.IS_ALL_BUILDS == "true"}
            }

            steps {
                sh 'flutter doctor'
            }
        }
        stage ('Build IOS Release') {
            when {
                expression {env.IS_IOS_BUILD == "true" || env.IS_ALL_BUILDS == "true"}
            }

            steps {
                sh "curl --location --request POST 'https://api.codemagic.io/builds' \
                    --header 'Content-Type: application/json' \
                    --header 'x-auth-token: eXFu75mnUwvXd7tOWNfV4v-GLaz8LmC4U7T-pMN_NvQ' \
                    --data-raw '{\"appId\": \"5f8d489724a2011e6f4f393d\",\"workflowId\": \"5f8d489724a2011e6f4f393c\",\"branch\": \"dev\"}'"
            }
        }
        stage ('Build Android Debug') {
            when {
                expression {env.IS_ANDROID_DEBUG_BUILD == "true" || env.IS_ALL_BUILDS == "true"}
            }

            steps {
                sh "flutter build apk --debug"
                script {
                    sh "mv $DEBUG_APK_ROUTE/app-debug.apk $DEBUG_APK_ROUTE/${env.PROJECT_NAME}-v${env.PROJECT_VERSION}-debug.apk"

                    archiveArtifacts artifacts: "$DEBUG_APK_ROUTE/${env.PROJECT_NAME}-v${env.PROJECT_VERSION}-debug.apk"
                }
            }
        }
        stage ('Build Android Release') {
            when {
                expression {env.IS_ANDROID_RELEASE_BUILD == "true" || env.IS_ALL_BUILDS == "true"}
            }

            steps {
                sh "flutter build apk --release"
                script {
                    sh "mv $RELEASE_APK_ROUTE/app-release.apk $RELEASE_APK_ROUTE/${env.PROJECT_NAME}-v${env.PROJECT_VERSION}-release.apk"

                    archiveArtifacts artifacts: "$RELEASE_APK_ROUTE/${env.PROJECT_NAME}-v${env.PROJECT_VERSION}-release.apk"
                }
            }
        }
    }
    post {
        success {
             echo "Success"
//              bitbucketStatusNotify(buildState: 'SUCCESSFUL')
             bitbucketStatusNotify(
              buildState: 'SUCCESSFUL',
              buildKey: 'test',
              buildName: 'Test',
              repoSlug: 'my_catalog',
              commitId: '57fb7e5ab9b9526e397cc65e04afb7c251b85eb6'
             )
             script {
                  if (env.IS_ANDROID_DEBUG_BUILD == "true" || env.IS_ANDROID_RELEASE_BUILD == "true" || env.IS_IOS_BUILD == "true" || env.IS_ALL_BUILDS == "true") {
                      // Telegram send notification with Image
                      defaultTelegramMessage("${env.PROJECT_NAME} $BUILD_STATUS_TEXT $STATUS_SUCCESS ${env.Build_text} $SUCCESS_IMAGE", TELEGRAM_BOT_TOKEN, TELEGRAM_CHAT_ID)

                      // Slack send notification
                      slackSend message: "${env.PROJECT_NAME} $BUILD_STATUS_TEXT $STATUS_SUCCESS ${env.Build_text} $SUCCESS_IMAGE", color: "good"
                  }
             }
        }
        aborted {
            echo "Aborted"
            bitbucketStatusNotify(buildState: 'FAILED')
            script {
                if (env.IS_ANDROID_DEBUG_BUILD == "true" || env.IS_ANDROID_RELEASE_BUILD == "true" || env.IS_IOS_BUILD == "true" || env.IS_ALL_BUILDS == "true") {
                    // Telegram logs post
                    defaultTelegramMessage("${env.PROJECT_NAME} $BUILD_STATUS_TEXT $STATUS_ABORTED ${env.Build_text} $ABORTED_IMAGE", TELEGRAM_BOT_TOKEN, TELEGRAM_CHAT_ID)

                    // Slack send notification
                    slackSend message: "${env.PROJECT_NAME} $BUILD_STATUS_TEXT $STATUS_ABORTED ${env.Build_text} $ABORTED_IMAGE", color: "danger"
                }
            }
        }
        failure {
            echo "Failure"
            bitbucketStatusNotify(buildState: 'FAILED')
            script {
                if (env.IS_ANDROID_DEBUG_BUILD == "true" || env.IS_ANDROID_RELEASE_BUILD == "true" || env.IS_IOS_BUILD == "true" || env.IS_ALL_BUILDS == "true") {
                    // Telegram logs post
                    defaultTelegramMessage("${env.PROJECT_NAME} $BUILD_STATUS_TEXT $STATUS_FAILED ${env.Build_text} $ERROR_IMAGE", TELEGRAM_BOT_TOKEN, TELEGRAM_CHAT_ID)

                    // Slack send notification
                    slackSend message: "${env.PROJECT_NAME} $BUILD_STATUS_TEXT $STATUS_FAILED ${env.Build_text} $ERROR_IMAGE", color: "danger"
                }
            }
        }
    }
}
