# codebuild_locally
AWS CodeBuild를 로컬에서 실행

<br>

# 쉘 스크립트 다운로드

```bash
git clone https://github.com/aws/aws-codebuild-docker-images.git
cd ./aws-codebuild-docker-images/local_builds

ls -l codebuild_build.sh
```

<br>

# 쉘 스크립트 실행 방법
* 쉘 스크립트 실행권한 설정

```bash
chmod u+x codebuild_build.sh
```

* 쉘 스크립트 실행 인자

```bash
./codebuild_build.sh \
	-i _<container-image-name>_ \
	-a _<artifact-output-directory> \
	-s <project-code-directory>
```

* 실행 예(ARM계열 도커 이미지 사용)

```bash
/codebuild_build.sh \
	-i public.ecr.aws/codebuild/local-builds:aarch64 \
	-l public.ecr.aws/codebuild/local-builds:aarch64 \
	-a artifacts \
	-s ./example-1
```
