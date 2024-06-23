# 베이스 이미지 OpenJDK 21 slim 버전으로 설정
FROM openjdk:21-jdk-slim

# 작업 디렉토리를 /app으로 설정
WORKDIR /app

# Gradle Wrapper 및 설정 파일들을 컨테이너의 /app 디렉토리로 복사
COPY gradlew build.gradle settings.gradle /app/
COPY gradle /app/gradle

# 소스 코드 및 리소스 파일들을 컨테이너의 /app/src 디렉토리로 복사
COPY src /app/src

# gradlew 파일에 실행 권한 부여
RUN chmod +x gradlew

# Gradle을 사용하여 프로젝트를 빌드
RUN ./gradlew build

# 컨테이너에서 외부로 노출할 포트 설정
EXPOSE 8080

# Spring Boot 애플리케이션 실행
CMD ["java", "-jar", "/app/build/libs/leaveWork-0.0.1-SNAPSHOT.jar"]

