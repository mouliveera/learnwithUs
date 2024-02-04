FROM alpine

LABEL maintainer="Mouli Veera"
RUN apk add nginx --no-cache

EXPOSE 70:80

CMD ["nginx", "-g", "daemon off;"]
