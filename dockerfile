FROM centos
USER root

RUN yum install epel-release -y

RUN yum install python-pip -y

RUN pip install zookeeper-healthcheck

RUN yum install java -y
RUN yum update -y
RUN yum install nc -y
RUN yum install wget -y
RUN  wget https://archive.apache.org/dist/zookeeper/zookeeper-3.4.10/zookeeper-3.4.10.tar.gz


EXPOSE 80

EXPOSE 2181

RUN tar -zxf zookeeper-3.4.10.tar.gz

COPY ./zoo.cfg ./zookeeper-3.4.10/conf/


RUN mkdir /zookeeper-3.4.10/data


RUN cd bin
RUN chown root ./zookeeper-3.4.10/bin/zkServer.sh
COPY ./_bash_zoo.sh ./zookeeper-3.4.10/bin/
CMD ["/bin/bash" ,"/zookeeper-3.4.10/bin/_bash_zoo.sh"]

