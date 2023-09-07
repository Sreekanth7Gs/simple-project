---
- name: Installation of maven
  hosts: Build-slave
  become: true
  tasks:
  - name: Update the packages
    apt: 
      update_cache: yes

  - name: installtion of java
    apt:
      name: openjdk-11-jdk
      state: present

  - name: download the maven packages
    get_url:
      url: https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz
      dest: /opt

  - name: extract the packages
    unarchive:
      src: /opt/apache-maven-3.9.4-bin.tar.gz
      dest: /opt
      remote_src: yes
