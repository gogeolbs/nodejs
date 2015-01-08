#
# Node.js Dockerfile
#
# https://github.com/dockerfile/nodejs
#

# Pull base image.
FROM dockerfile/python
ENV VERSION v0.10.35

# Install Node.js
RUN \
  cd /tmp && \
  wget http://nodejs.org/dist/$VERSION/node-$VERSION.tar.gz && \
  tar xvzf node-$VERSION.tar.gz && \
  rm -f node-$VERSION.tar.gz && \
  cd node-v* && \
  ./configure && \
  CXX="g++ -Wno-unused-local-typedefs" make && \
  CXX="g++ -Wno-unused-local-typedefs" make install && \
  cd /tmp && \
  rm -rf /tmp/node-v* && \
  echo '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bashrc

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]
