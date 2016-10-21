FROM registry.cn-hangzhou.aliyuncs.com/kk/kk-web:latest

COPY ./@app/job /@app/job

COPY ./lib/lua/job /lib/lua/job

COPY ./lib/lua/conf/job.lua /lib/lua/conf/job.lua

COPY ./static/job /static/job
