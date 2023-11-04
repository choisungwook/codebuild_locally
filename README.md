# 개요
AWS CodeBuild를 로컬에서 실행

<br>

# 쉘 스크립트 다운로드 방법

```bash
git clone https://github.com/aws/aws-codebuild-docker-images.git
cd ./aws-codebuild-docker-images/local_builds

ls -l codebuild_build.sh
```

<br>

# 쉘 스크립트 실행 방법

## 도커 이미지 pull

* Agent 도커 이미지
```bash
# For x86_64
docker pull public.ecr.aws/codebuild/local-builds:latest

# For ARM(or MacOS)
docker pull public.ecr.aws/codebuild/local-builds:aarch64
```

* Build 도커 이미지
```bash
# x86
docker pull public.ecr.aws/codebuild/amazonlinux2-x86_64-standard:5.0-23.07.28

# ARM
docker pull public.ecr.aws/codebuild/amazonlinux2-aarch64-standard:3.0
```

## 쉘 스크립트 실행권한 설정

```bash
chmod u+x codebuild_build.sh
```

## 쉘 스크립트 실행 인자: `-i`와 `-a`는 필수

```bash
./codebuild_build.sh \
	-i <Build-container-image-name> \
	-a <artifact-output-directory> \
	-l <Agent-container-image-name> \
	-s <project-code-directory>
```

## 실행 예(ARM계열 도커 이미지 사용)

```bash
./codebuild_build.sh \
	-i public.ecr.aws/codebuild/amazonlinux2-aarch64-standard:3.0 \
	-l public.ecr.aws/codebuild/local-builds:aarch64 \
	-a artifacts \
	-s ./example-1
```

<br>

# 예제
## 예제1. echo helloworld

```bash
./codebuild_build.sh \
	-i public.ecr.aws/codebuild/amazonlinux2-aarch64-standard:3.0 \
	-l public.ecr.aws/codebuild/local-builds:aarch64 \
	-a artifacts \
	-s ./example-1
```

## 예제2. put item to s3
* [IAM Role](./example-2/terraform/iam.tf)생성하고 AWS profile설정 후 실행

```bash
# AWS profile 설정 예
$ cat ~/.aws/config
[default]
region = ap-northeast-2

[profile codebuild]
source_profile = default
role_arn = arn:aws:iam::xxxxxxxx:role/CodeBuild-locally-demo

# CodeBuild 로컬 실행
./codebuild_build.sh \
	-i public.ecr.aws/codebuild/amazonlinux2-aarch64-standard:3.0 \
	-l public.ecr.aws/codebuild/local-builds:aarch64 \
	-a artifacts \
	-c \
	-p codebuild \
	-s ./example-2
```

# 참고자료
* https://docs.aws.amazon.com/ko_kr/codebuild/latest/userguide/build-env-ref-available.html
* https://aws.amazon.com/ko/about-aws/whats-new/2018/05/aws-codebuild-now-supports-local-testing-and-debugging/
