#! /usr/bin/env perl -w

use GithubBot;

my $bot = GithubBot->new(
	# GH
	user => 'gh_user',
	repo => 'gh_repo',
	# IRC
	server => "irc.freenode.org",
	port => 7000,
	ssl => 1,
	channels => ["#poney"],
	nick => 'myGithubBot'
)->run();
