# HG-CoLoR
HG-CoLoR (Hybrid Graph for the error Correction of Long Reads) is a hybrid method for the
error correction of long reads that follows the main idea from NaS to produce synthetic
long reads. Instead of directly being corrected, the long reads are used as templates to
produce assemblies of related accurate short reads as corrections.

HG-CoLoR however, instead of aligning all the short reads against each other, focuses on
a seed-and-extend approach based on a hybrid structure between a de Bruijn graph and an
overlap graph, built from the short reads. This hybrid graph allows to compute perfect
overlaps of variable length between the short reads' k-mers, and is used to extend and
link together the seeds, which are short reads that align correctly on the input long
reads, using them as anchor points. The synthetic long reads are thus produced by directly
assembling the k-mers of the short reads during the graph traversal, without using any
other proper assembly tool.

Pre-requisites
--------------

  - A Linux based operating system.
  - Shell tool GNU Parallel available through your PATH environment variable (https://www.gnu.org/software/parallel/).
  - Emboss binaries accessible through your PATH environment variable (http://emboss.sourceforge.net/download/).
  - Jellyfish binary accessible through your PATH environment variable (https://github.com/gmarcais/Jellyfish).
  - QuorUM binary accessible through your PATH environment variable (https://github.com/gmarcais/Quorum).
  - PgSA directory accessible somewhere on your computer (https://github.com/kowallus/PgSA).
  
Dependencies
--------------

The blasr binary comes from the blasr software. Copyright notice is given in the file
bin/blasr-license.
The PgSAgen.cpp file was copied, and the SLRgen.cpp, seedsLinking.cpp, and seedsLinking.h
files were adapted from the PgSA sources.
  
Installation
--------------

  1. Go to the PgSA directory, and compile the PgSA library:  
  `make build CONF=pgsalib`
  2. Go back to the HG-CoLoR directory and run:             
  `make PGSA_PATH=/absolute/path/to/your/PgSA/folder/`
  
Running HG-CoLoR
--------------

To run HG-CoLoR, run the following command:       
`./HG-CoLoR --longreads LR.fasta --shortreads SR.fastq --out result.fasta`

### Input

  - LR.fasta: fasta file of long reads, one sequence per line.
  - SR.fastq: fastq file of short reads.                      
    Warning: only one file must be provided.                      
    If using paired reads, please concatenate them into one single file.
  - result.fasta: fasta file where to output the synthetic long reads.

### Options

      --kmer:           k-mer size for the graph construction (default: 64).
      --seedsoverlap:   Minimum overlap length to allow the merging of two overlapping seeds (default: k-1).
      --minoverlap:     Minimum overlap length to allow the exploration of an edge of the graph (default: k-5).
      --backtracks:     Maximum number of backtracks (default: 1,125).
      --seedskips:      Maximum number of seed skips (default: 5).
      --bestn:          Top alignments to be reported by BLASR (default: 30).
      --nproc:          Number of processes to run in parallel (default: number of cores).
      --help:           Print a help message.
      
Notes
--------------

HG-CoLoR has been developed and tested on x86-64 GNU/Linux.          
Support for any other platform has not been tested.

Authors
--------------

Pierre Morisse, Thierry Lecroq and Arnaud Lefebvre.

Reference
--------------

Currently submitted to Jobim 2017, under the title:               
HG-CoLoR: A new method for the production of synthetic long reads

Contact
--------------

You can report problems and bugs to pierre[dot]morisse2[at]univ-rouen[dot]fr
