#!/usr/bin/env bash

./get_covar_file.r

cut -f1-22,103- -d' ' cmtz_hbf_100pcs.cov > cmtz_hbf_20pcs.cov
cut -f1-22,103- -d' ' cmtz_hbf_100pcs_with_agesq.cov > cmtz_hbf_20pcs_with_agesq.cov

cut -f1-32,103- -d' ' cmtz_hbf_100pcs.cov > cmtz_hbf_30pcs.cov
cut -f1-32,103- -d' ' cmtz_hbf_100pcs_with_agesq.cov > cmtz_hbf_30pcs_with_agesq.cov

cut -f1-52,103- -d' ' cmtz_hbf_100pcs.cov > cmtz_hbf_50pcs.cov
cut -f1-52,103- -d' ' cmtz_hbf_100pcs_with_agesq.cov > cmtz_hbf_50pcs_with_agesq.cov

