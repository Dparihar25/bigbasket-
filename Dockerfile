FROM redhat/ubi8:latest
RUN yum install wget -y
RUN wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm
RUN yum install jdk-8u131-linux-x64.rpm -y
RUN yum install maven -y
WORKDIR /app
COPY . /app
RUN mvn clean package
ENTRYPOINT ["java","-jar"]
CMD ["target/bigbasket-1.0-SNAPSHOT.jar"]

