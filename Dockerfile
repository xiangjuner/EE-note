# Use the default python 2.7 image
FROM gitlab-registry.cern.ch/atlas-physics-office/gitlab-integration/pogitlab

# nstall PyYaml
COPY . /user/share/atlaslatex

MAINTAINER J. P. Araque <jp.araque@cern.ch>
