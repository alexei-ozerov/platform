#!/usr/bin/env nu

#
# Functions
#

# 
# Main
#

# Container Image Management.
def "main image" [] {}

# Build & push image to registry.
def "main image build" [
  --image (-i): string # The name of the image you want to create.
  --tag (-t): string  # The name of the tag you wish to apply.
  --registry (-r): string # The name of the registry you wish to push to.
  --dockerfile (-d)="dockerfile": string # The name of the dockerfile you wish to build.
  --context (-c)=".": string # The directory to use as context for the build.
] {
  print $"($registry)/($image)/($tag)"
}

