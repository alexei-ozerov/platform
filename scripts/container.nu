#!/usr/bin/env nu

#
# Functions
#

# 
# Main
#

# Container Container Management.
def "main container" [] {}

# Run image.
def "main container run" [
  --image (-i): string # The name of the image you want to run.
  --tag (-t): string  # The name of the tag you wish to run.
  --registry (-r): string # The name of the registry you wish to pull from.
  --mode (-m) # Do you run the container as interactive or not.
] {
  print $"($registry)/($image)/($tag)"
}

