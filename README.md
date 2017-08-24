# jenkins-template

[GitHub OAuth](https://wiki.jenkins.io/display/JENKINS/GitHub+OAuth+Plugin)

<https://github.com/settings/applications/new>

The important part of the callback URL is /securityRealm/finishLogin

```
def projectName='jenkins-pipeline-sample'
multibranchPipelineJob(projectName) {
    branchSources {
        github {
            repoOwner('janrotter')
            repository(projectName)
            scanCredentialsId('janrotter-bot.github.com')
        }
    }
    orphanedItemStrategy {
        discardOldItems {
            numToKeep(20)
        }
    }

    triggers {
        periodic(10)
    }

    orphanedItemStrategy {
        discardOldItems {
            daysToKeep(1)
            numToKeep(3)
        }
    }
}
```

```
pipelineJob('.pipeline sandbox') {
    definition {
        cps {
            script('''
                node {
                    stage('somestage') {
                        sh 'echo hello'
                    }
                }
            '''.stripIndent())
            sandbox()
        }
    }
}
```