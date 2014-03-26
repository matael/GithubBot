#! /usr/bin/env perl -w

use GithubBot;

my $bot = GithubBot->new(
	# IRC
	server => "irc.freenode.org",
	port => 7000,
	ssl => 1,
	channels => ["#poney"],
	nick => 'myGithubBot'
)->run();
