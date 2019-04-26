FROM metacpan/metacpan-base:latest

ENV PERL_MM_USE_DEFAULT=1

COPY cpanfile cpanfile.snapshot /metacpan-api/
WORKDIR /metacpan-api

# CPM installations of dependencies does not install or run tests. This is
# because the modules themselves have been tested, and the metacpan use of the
# modules is tested by the test suite. Removing the tests, reduces the overall
# size of the images.
RUN useradd -m metacpan-api -g users \
    && mkdir /CPAN \
    && cpm install --global --without-test \
    && rm -fr /root/.cpanm /root/.perl-cpm /var/cache/apt/lists/* /tmp/*

RUN chown -R metacpan-api:users /metacpan-api /CPAN

VOLUME /CPAN

USER metacpan-api:users

EXPOSE 5000

CMD /wait-for-it.sh ${PGDB} -- ${API_SERVER} ./bin/api.pl
