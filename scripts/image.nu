#!/usr/bin/env nu

#
# Functions
#

# 
# Main
#

# Create image: build & push to registry.
def "main create image" [
  --image (-i): string # The name of the image you want to create.
  --tag (-t): string  # The name of the tag you wish to apply.
  --registry (-r): string # The name of the registry you wish to push to.
  --dockerfile (-d)="dockerfile": string # The name of the dockerfile you wish to build.
  --context (-c)=".": string # The directory to use as context for the build.
] {
  print $"($registry)/($image)/($tag)"
}

