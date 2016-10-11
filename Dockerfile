FROM registry.cn-hangzhou.aliyuncs.com/kk/kk-nginx:latest

COPY ./@app/job /@app/job

COPY ./lib/lua/job /lib/lua/job

COPY ./lib/lua/conf /lib/lua/conf

