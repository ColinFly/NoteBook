## Gradle 初步

### 1.Gradle是什么
>gradle跟ant/maven一样，是一种依赖管理/自动化构建工具。但是跟ant/maven不一样，它并没有使用xml语言，而是采用了Groovy语言，这使得它更加简洁、灵活，更加强大的是，gradle完全兼容maven和iv

### 2.基本配置
 maven对应的是pom.xml,gradle则是build.gradle。Android项目通常包含两个build.gradle文件，一个是project范围的。另一个是module范围的。

 1. project下的build.gradle

        buildscript{
          repositories
            jcenter()//构建过程依赖的仓库
          }

          dependencies{
            classpath 'com.android.tools.build:gradle:1.1.0'//声明gradle插件的版本
          }

          //这里配置的是整个项目的依赖仓库，这样每个module就不用配置了
          allprojects{
            repositories{
              jcenter()
            }
          }

        }

注：为什么repositories要声明两次呢，因为作用是不同的，buildscript配置给gradle本身所需的资源
allprojects是配置项目所有模块所需的资源

2. module下的gradle
        apply plugin: 'com.android.application'

        android{
          complileSdkVersion 21//编译版本
          buildToolsVersion "21.1.2"//bouildTool的版本

          defaultConfig{//默认配置，会同时应用到debug和release版本
            applicationId "com.het.sunriss"//包名
            minSdkVersion 15
            targetSdkVersion 21
            versionCode 1
            verSionName "1.0"
          }

          buildTypes{
            release {
              // 不显示Log
              buildConfigField "boolean", "LOG_DEBUG", "false"
              //release版本
              minifyEnabled true//是否开启混淆
              shrinkResources true
              proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'//混淆文件位置
               signingConfig  signingConfigs.HetConfig //使用上面定义的签名配置文件
              }
          }

          signingConfigs {    //签名配置
              HetConfig { //签名配置标签，可以有多个
              //建议密码不要明文写这里，写在gradle.properties中，再通过storeFile引用
              storeFile file("Het_KeyStore") //签名文件
              storePassword "szhittech"   //签名密码
              keyAlias "Clife"            //应用别名
              keyPassword "szhittechclife"  //应用别名密码
            }
        }

          // 移除lint检查的error
            lintOptions {
              abortOnError false
            }

            dependencies {  //当前模块的依赖
              compile fileTree(dir: 'libs', include: ['*.jar'])
              //编译lib目录里面的所有*.jar文件
              testCompile 'junit:junit:4.12'
              compile 'com.android.support:appcompat-v7:23.1.1'
              provided 'com.android.support:design:23.1.1' //编译时依赖，但不包含
              compile project(':test:SimpleAndroid') //编译test目录下的SimpleAndroid
              compile 'com.android.common:baseprj:23.1.1@aar' //编译依赖第三方的aar文件
              compile (name:'xxx', ext:'aar')编译本地aar依赖文件
              compile (group:'xxxx', name: 'xxxx', version: 'xxxx'){
              exclude group:'xxx', module:'xxx'  //排除依赖，解决依赖冲突，module对应的就是artifactId。
              compile 'com.android.support:multidex:1.0.0' //支持多dex，具体见后续分析
              }
        }
