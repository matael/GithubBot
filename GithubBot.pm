package GithubBot;

use strict;
use warnings;

use Net::GitHub::V3;

use Bot::BasicBot;
use base qw(Bot::BasicBot);

sub said {
	my ($self,$msg) = @_;

	my $issues;
	if ( $msg->{body} =~ /^\@todolist\s?(.+)?$/) {

		my $gh = Net::GitHub::V3->new;
		my $issues_api = $gh->issue;

		my %default_params = (state => 'open');
		if (defined $1) {
			$default_params{labels} = $1;
			$issues = $issues_api->repos_issues(
				$self->{user},
				$self->{repo},
				\%default_params);
		} else {
			$issues = $issues_api->repos_issues(
				$self->{user},
				$self->{repo},
				\%default_params);
		}
	}

	foreach my $issue (@{$issues}) {
		my @labels;
		foreach my $l (@{$issue->{labels}}) {
			push @labels , $l->{name};
		}
		my $body = $issue->{number}.'# '.$issue->{title}.' ['.join('][', @labels).']';
		$self->say({
			channel => $msg->{channel},
			body => $body,
		})
	}
}

1;
