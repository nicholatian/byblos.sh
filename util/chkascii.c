/*********************************************************************\
 *                         xion.mt/byblos.sh                         *
 *                 Byblos v1 SDK installation script                 *
 *                                                                   *
 *               Copyright (C) 2024 Alexander Nicholi.               *
 *         Released under the Artisan Software Licence, v1.1         *
 *  Some rights reserved. See <https://asl.xion.mt/v1.1> for terms.  *
\*********************************************************************/

#include <errno.h>
#include <stdarg.h>
#include <stdio.h>
#include <string.h>

enum
{
	BUFSZ = 4096
};

const char * const helptext = "%s%s\n" \
	"utility to validate files as ASCII compliant\n\n" \
	"Copyright (C) 2024 Alexander Nicholi\n" \
	"Released under the Artisan Software Licence, v1.1\n" \
	"Some rights reserved. See <https://asl.xion.mt/v1.1> for" \
	" terms.\n\n" \
	"Usage:\n" \
	"\t%s%s [-q|--quiet]\n\n" \
	"File to process is read from stdin.\n" \
	"Results are echoed to stderr, unless -q or --quiet is" \
	" given.\n" \
	"Return value is 0 on success, 1 on failure, and 127 on" \
	" error.\n";

unsigned char buf[BUFSZ];
unsigned char quiet;

void print( const char * fmt, ... )
{
	va_list args;

	if(quiet)
	{
		return;
	}

	va_start( args, fmt );
	vfprintf( stderr, fmt, args );
	va_end( args );
}

static void check( unsigned char ch, int * ret, int * line, int * col )
{
	if((ch & 0x80) != 0)
	{
		print( "line %i, column %i: bad char 0x%X\n", *line,
		       *col, ch );

		*ret = 1;
	}
	else if(ch == '\n')
	{
		/* reset the line-column matrix */
		*line++;
		/* effectively set to 1 by side-effect below */
		*col = 0;
	}

	*col++;
}

static int process( void )
{
	size_t c;
	int i, ret = 0, line = 1, col = 1, end = 0;

	while(!end)
	{
		c = fread( buf, 1, BUFSZ, stdin );

		end = c < BUFSZ ? 1 : 0;

		for(i = 0; i < c; ++i)
		{
			check( buf[i], &ret, &line, &col );
		}

		if(end && ferror( stdin ))
		{
			print( "Error on stdin\n" );
			clearerr( stdin );

			return -1;
		}
	}

	return ret;
}

static int isdotc( char * av0 )
{
	const size_t sz = strlen( av0 );

	return (av0[sz - 2] == '.' && av0[sz - 1] == 'c')
	       ? 1 : 0;
}

const char * const tccrun = "tcc -run ";
const char * const empty = "";

int main( int ac, char * av[] )
{
	int i, r;

	quiet = 0;

	memset( buf, 0, BUFSZ );

	for(i = 1; i < ac; ++i)
	{
		if(!strcmp( av[i], "-q" )
		|| !strcmp( av[i], "--quiet" ))
		{
			quiet = 1;
		}
		else if(!strcmp( av[i], "-h" )
		|| !strcmp( av[i], "--help" )
		|| !strcmp( av[i], "-?" ))
		{
			const int runsrc = isdotc( av[0] );

			fprintf( stdout, helptext, runsrc ? tccrun
			         : empty, av[0], runsrc ? tccrun :
			         empty, av[0] );

			return 0;
		}
	}

	r = process( );

	if(r < 0)
	{
		print( "Aborting due to fatal errors\n" );

		return 127;
	}

	print( "File is %s\n", r == 0 ? "well-formed"
	       : "erroneous" );

	return r;
}
