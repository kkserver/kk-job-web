FROM registry.cn-hangzhou.aliyuncs.com/kk/kk-nginx:lastest

COPY ./@app/job /@app/job

COPY ./lib/lua/job /lib/lua/job

