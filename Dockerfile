from php:7.3.6-fpm-alpine

WORKDIR /app

RUN apk --update upgrade \
    && apk add --no-cache autoconf automake make gcc g++ icu-dev \
    && pecl install apcu-5.1.17 \
    && docker-php-ext-install -j$(nproc) \
       bcmath \
       opcache \
       pdo \
       pdo_mysql \
       tokenizer \
   && docker-php-ext-enable \
       apcu \
       opcache

COPY etc/php/ /usr/local/etc/php/
