# Copyright 2017 Google Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#FROM ubuntu:16.04

#RUN apt-get update && \
#    apt-get install -y kmod gcc make curl && \
#    rm -rf /var/lib/apt/lists/*

FROM centos:7.5.1804

ENV KVER 3.10.0-862.3.2.el7.x86_64

RUN uname -r && \
    ls -l /usr/src/kernels && \
#    yum install -y linux-headers-$(uname -r) && \
#    yum install -y kernel kernel-devel && \
#    yum install -y kernel-devel-$(uname -r) && \
    yum install -y kernel-devel-${KVER} && \
    ls -l /usr/src/kernels && \
#    yum install -y linux-headers && \
    yum group install -y "Development Tools" && \
#    yum -y update && \
    uname -r

COPY entrypoint.sh /entrypoint.sh

CMD /entrypoint.sh
