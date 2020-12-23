<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'wordpress_user' );

/** MySQL database password */
define( 'DB_PASSWORD', 'password' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'oN(+kWT@9;[Q-1xUd&8={RM?>iw?=~s3[p9>7k _$L6+jNsX6u$ge-T|Apxz+B-A');
define('SECURE_AUTH_KEY',  'M>{*X3AdC{K9TOf%c]s`KT*^kQ17k&+|YuqQTMgMYI_?!+Ej/: 1nJ=$bnba1u]U');
define('LOGGED_IN_KEY',    'xwr!p]9|o1|G>{X0v0A?4^tD<N-ML_y%E@E(tg+^M}|)k6:1iw8-g3b:]Jok=Q4~');
define('NONCE_KEY',        '8}||q|spL7J0zU:qB4G~sF<uHv=PgH|}o<&wCT{LyyVSN*O_k1(6Rq0at*+LPnBD');
define('AUTH_SALT',        'l.mdg-phNc&bhGcN=pb$)+_>OD^rS$y|8vI>z{=.nM%nWJQdFM261mJd|?i31-i<');
define('SECURE_AUTH_SALT', '-nFrbP`{pD ?_KH(6i!7`dDrOSmX[25N<zfJgH Rgg+m33hu4KB<t8#JnBDmZ6e`');
define('LOGGED_IN_SALT',   'qL3&,:) 1b%4k@}&YP5ijDxJ#iV^LE1}6m0|lI*FzE|*hAE)-,|(`d#Jgl$RCucy');
define('NONCE_SALT',       '*5:(0ZTNSY:JCx*FJ/)zr0@X1%Hj`/XKw}WNA-P|MK!|LzX^}SAg[|aP>-wyAQ~:');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
