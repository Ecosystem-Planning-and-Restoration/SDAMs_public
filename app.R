source('./global/global.R')



ui <- fluidPage(
  tags$html(class = "no-js", lang="en"),
  tags$style(HTML("
        input[type=number] {
              -moz-appearance:textfield;
        }
        input[type=number]::{
              -moz-appearance:textfield;
        }
        input[type=number]::-webkit-outer-spin-button,
        input[type=number]::-webkit-inner-spin-button {
              -webkit-appearance: none;
              margin: 0;
        }
        .border-my-text {
            border: 2px solid black;
            border-padding: 2px;
            background-color: #b4bfd1;
            text-align: center;
        }
        .border-my-class {
            border: 2px solid black;
            border-padding: 40px;
            background-color: black;
            color: white;
            text-align: center;
        }
        #reg_button {
            background-color:#94d9f2;
            padding: 7px;
            font-size: 110%;
            font-weight: bold;
            border-style: outset;
            
            box-shadow: 0 8px 12px 0 rgba(0,0,0,0.24), 0 1px 1px 0 rgba(0,0,0,0.19);
            transition-duration: 0.1s;
        }
        #reg_button:hover {
            background-color:#5d8b9c;
            color: black;
            border-style: solid;
            border-color: black;
            border-width: px;
        }
        #indicator_button {
            background-color:#94d9f2;
            padding: 7px;
            font-size: 110%;
            font-weight: bold;
            border-style: outset;
            
            box-shadow: 0 8px 12px 0 rgba(0,0,0,0.24), 0 1px 1px 0 rgba(0,0,0,0.19);
            transition-duration: 0.1s;
        }
        #indicator_button:hover {
            background-color:#5d8b9c;
            color: black;
            border-style: solid;
            border-color: black;
            border-width: px;
        }
        #runmodel {
            background-color:#94d9f2;
            padding: 7px;
            font-size: 110%;
            font-weight: bold;
            border-style: outset;
            
            box-shadow: 0 8px 12px 0 rgba(0,0,0,0.24), 0 1px 1px 0 rgba(0,0,0,0.19);
            transition-duration: 0.1s;
        }
        #runmodel:hover {
            background-color:#5d8b9c;
            color: black;
            border-style: solid;
            border-color: black;
            border-width: px;
        }
        #report {
            background-color:#94d9f2;
            padding: 7px;
            font-size: 110%;
            font-weight: bold;
            border-style: outset;
            
            box-shadow: 0 8px 12px 0 rgba(0,0,0,0.24), 0 1px 1px 0 rgba(0,0,0,0.19);
            transition-duration: 0.1s;
        }
        #report:hover {
            background-color:#5d8b9c;
            color: black;
            border-style: solid;
            border-color: black;
            border-width: px;
        }
        .leaflet-popup-content {
            text-align: center;
        }


    ")),
  tags$head(
	HTML(
		"<!-- Google Tag Manager -->
		<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
		new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
		j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
		'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
		})(window,document,'script','dataLayer','GTM-L8ZB');</script>
		<!-- End Google Tag Manager -->
		"
		),
    tags$meta(charset="utf-8"),
    tags$meta(property="og:site_name", content="US EPA"),
    #tags$link(rel = "stylesheet", type = "text/css", href = "css/uswds.css"),
    tags$link(rel = "stylesheet", type = "text/css", href = "https://cdnjs.cloudflare.com/ajax/libs/uswds/3.0.0-beta.3/css/uswds.min.css", integrity="sha512-ZKvR1/R8Sgyx96aq5htbFKX84hN+zNXN73sG1dEHQTASpNA8Pc53vTbPsEKTXTZn9J4G7R5Il012VNsDEReqCA==", crossorigin="anonymous", referrerpolicy="no-referrer"),
    tags$meta(property="og:url", content="https://www.epa.gov/themes/epa_theme/pattern-lab/.markup-only.html"),
    tags$link(rel="canonical", href="https://www.epa.gov/themes/epa_theme/pattern-lab/.markup-only.html"),
    tags$link(rel="shortlink", href="https://www.epa.gov/themes/epa_theme/pattern-lab/.markup-only.html"),
    tags$meta(property="og:url", content="https://www.epa.gov/themes/epa_theme/pattern-lab/.markup-only.html"),
    tags$meta(property="og:image", content="https://www.epa.gov/sites/all/themes/epa/img/epa-standard-og.jpg"),
    tags$meta(property="og:image:width", content="1200"),
    tags$meta(property="og:image:height", content="630"),
    tags$meta(property="og:image:alt", content="U.S. Environmental Protection Agency"),
    tags$meta(name="twitter:card", content="summary_large_image"),
    tags$meta(name="twitter:image:alt", content="U.S. Environmental Protection Agency"),
    tags$meta(name="twitter:image:height", content="600"),
    tags$meta(name="twitter:image:width", content="1200"),
    tags$meta(name="twitter:image", content="https://www.epa.gov/sites/all/themes/epa/img/epa-standard-twitter.jpg"),
    tags$meta(name="MobileOptimized", content="width"),
    tags$meta(name="HandheldFriendly", content="true"),
    tags$meta(name="viewport", content="width=device-width, initial-scale=1.0"),
    tags$meta(`http-equiv`="x-ua-compatible", content="ie=edge"),
    tags$script(src = "js/pattern-lab-head-script.js"),
# update this line with your title:    tags$title('ContDataQC | US EPA'),
    tags$link(rel="icon", type="image/x-icon", href="https://www.epa.gov/themes/epa_theme/images/favicon.ico"),
    tags$meta(name="msapplication-TileColor", content="#FFFFFF"),
    tags$meta(name="msapplication-TileImage", content="https://www.epa.gov/themes/epa_theme/images/favicon-144.png"),
    tags$meta(name="application-name", content=""),
    tags$meta(name="msapplication-config", content="https://www.epa.gov/themes/epa_theme/images/ieconfig.xml"),
    tags$link(rel="apple-touch-icon-precomposed", sizes="196x196", href="https://www.epa.gov/themes/epa_theme/images/favicon-196.png"),
    tags$link(rel="apple-touch-icon-precomposed", sizes="152x152", href="https://www.epa.gov/themes/epa_theme/images/favicon-152.png"),
    tags$link(rel="apple-touch-icon-precomposed", sizes="144x144", href="https://www.epa.gov/themes/epa_theme/images/favicon-144.png"),
    tags$link(rel="apple-touch-icon-precomposed", sizes="120x120", href="https://www.epa.gov/themes/epa_theme/images/favicon-120.png"),
    tags$link(rel="apple-touch-icon-precomposed", sizes="114x114", href="https://www.epa.gov/themes/epa_theme/images/favicon-114.png"),
    tags$link(rel="apple-touch-icon-precomposed", sizes="72x72", href="https://www.epa.gov/themes/epa_theme/images/favicon-72.png"),
    tags$link(rel="apple-touch-icon-precomposed", href="https://www.epa.gov/themes/epa_theme/images/favicon-180.png"),
    tags$link(rel="icon", href="https://www.epa.gov/themes/epa_theme/images/favicon-32.png", sizes="32x32"),
    tags$link(rel="preload", href="https://www.epa.gov/themes/epa_theme/fonts/source-sans-pro/sourcesanspro-regular-webfont.woff2", as="font", crossorigin="anonymous"),
    tags$link(rel="preload", href="https://www.epa.gov/themes/epa_theme/fonts/source-sans-pro/sourcesanspro-bold-webfont.woff2", as="font", crossorigin="anonymous"),
    tags$link(rel="preload", href="https://www.epa.gov/themes/epa_theme/fonts/merriweather/Latin-Merriweather-Bold.woff2", as="font", crossorigin="anonymous"),
    tags$link(rel="stylesheet", media="all", href="https://www.epa.gov/core/themes/stable/css/system/components/ajax-progress.module.css?r6lsex"),
    tags$link(rel="stylesheet", media="all", href="https://www.epa.gov/core/themes/stable/css/system/components/autocomplete-loading.module.css?r6lsex" ),
    tags$link(rel="stylesheet", media="all", href="https://www.epa.gov/core/themes/stable/css/system/components/js.module.css?r6lsex"),
    tags$link(rel="stylesheet", media="all", href="https://www.epa.gov/core/themes/stable/css/system/components/sticky-header.module.css?r6lsex"),
    tags$link(rel="stylesheet", media="all", href="https://www.epa.gov/core/themes/stable/css/system/components/system-status-counter.css?r6lsex"),
    tags$link(rel="stylesheet", media="all", href="https://www.epa.gov/core/themes/stable/css/system/components/system-status-report-counters.css?r6lsex"),
    tags$link(rel="stylesheet", media="all", href="https://www.epa.gov/core/themes/stable/css/system/components/system-status-report-general-info.css?r6lsex"),
    tags$link(rel="stylesheet", media="all", href="https://www.epa.gov/core/themes/stable/css/system/components/tabledrag.module.css?r6lsex"),
    tags$link(rel="stylesheet", media="all", href="https://www.epa.gov/core/themes/stable/css/system/components/tablesort.module.css?r6lsex"),
    tags$link(rel="stylesheet", media="all", href="https://www.epa.gov/core/themes/stable/css/system/components/tree-child.module.css?r6lsex"),
    tags$link(rel="stylesheet", media="all", href="https://www.epa.gov/themes/epa_theme/css/styles.css?r6lsex"),
    tags$link(rel="stylesheet", media="all", href="https://www.epa.gov/themes/epa_theme/css-lib/colorbox.min.css?r6lsex"),

    tags$script(src = 'https://cdnjs.cloudflare.com/ajax/libs/uswds/3.0.0-beta.3/js/uswds-init.min.js'),
    #fix container-fluid that boostrap RShiny uses
    tags$style(HTML(
      '.container-fluid {
            padding-right: 0;
            padding-left: 0;
            margin-right: 0;
            margin-left: 0;
        }
        .tab-content {
            margin-right: 30px;
            margin-left: 30px;
        }'
    ))
  ),
  tags$body(
			class="path-themes not-front has-wide-template", id="top",
			tags$script(
						src = 'https://cdnjs.cloudflare.com/ajax/libs/uswds/3.0.0-beta.3/js/uswds.min.js'
					   )
  ),
  
  # Site Header
  HTML(
    '<div class="skiplinks" role="navigation" aria-labelledby="skip-to-main">
      <a id="skip-to-main" href="#main" class="skiplinks__link visually-hidden focusable">Skip to main content</a>
    </div>

	<!-- Google Tag Manager (noscript) -->
	<noscript><iframe src=https://www.googletagmanager.com/ns.html?id=GTM-L8ZB
	height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
	<!-- End Google Tag Manager (noscript) -->

    <div class="dialog-off-canvas-main-canvas" data-off-canvas-main-canvas>
    <section class="usa-banner" aria-label="Official government website">
      <div class="usa-accordion">
        <header class="usa-banner__header">
          <div class="usa-banner__inner">
            <div class="grid-col-auto">
              <img class="usa-banner__header-flag" src="https://www.epa.gov/themes/epa_theme/images/us_flag_small.png" alt="U.S. flag" />
            </div>
            <div class="grid-col-fill tablet:grid-col-auto">
              <p class="usa-banner__header-text">An official website of the United States government</p>
              <p class="usa-banner__header-action" aria-hidden="true">Here’s how you know</p>
            </div>
            <button class="usa-accordion__button usa-banner__button" aria-expanded="false" aria-controls="gov-banner">
              <span class="usa-banner__button-text">Here’s how you know</span>
            </button>
          </div>
        </header>
        <div class="usa-banner__content usa-accordion__content" id="gov-banner">
          <div class="grid-row grid-gap-lg">
            <div class="usa-banner__guidance tablet:grid-col-6">
              <img class="usa-banner__icon usa-media-block__img" src="https://www.epa.gov/themes/epa_theme/images/icon-dot-gov.svg" alt="Dot gov">
              <div class="usa-media-block__body">
                <p>
                  <strong>Official websites use .gov</strong>
                  <br> A <strong>.gov</strong> website belongs to an official government organization in the United States.
                </p>
              </div>
            </div>
            <div class="usa-banner__guidance tablet:grid-col-6">
              <img class="usa-banner__icon usa-media-block__img" src="https://www.epa.gov/themes/epa_theme/images/icon-https.svg" alt="HTTPS">
              <div class="usa-media-block__body">
                <p>
                  <strong>Secure .gov websites use HTTPS</strong>
                  <br> A <strong>lock</strong> (<span class="icon-lock"><svg xmlns="http://www.w3.org/2000/svg" width="52" height="64" viewBox="0 0 52 64" class="usa-banner__lock-image" role="img" aria-labelledby="banner-lock-title banner-lock-description"><title id="banner-lock-title">Lock</title><desc id="banner-lock-description">A locked padlock</desc><path fill="#000000" fill-rule="evenodd" d="M26 0c10.493 0 19 8.507 19 19v9h3a4 4 0 0 1 4 4v28a4 4 0 0 1-4 4H4a4 4 0 0 1-4-4V32a4 4 0 0 1 4-4h3v-9C7 8.507 15.507 0 26 0zm0 8c-5.979 0-10.843 4.77-10.996 10.712L15 19v9h22v-9c0-6.075-4.925-11-11-11z"/></svg></span>) or <strong>https://</strong> means you’ve safely connected to the .gov website. Share sensitive information only on official, secure websites.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <div>
      <div class="js-view-dom-id-epa-alerts--public">
        <noscript>
          <div class="usa-site-alert usa-site-alert--info">
            <div class="usa-alert">
              <div class="usa-alert__body">
                <div class="usa-alert__text">
                  <p>JavaScript appears to be disabled on this computer. Please <a href="/alerts">click here to see any active alerts</a>.</p>
                </div>
              </div>
            </div>
          </div>
        </noscript>
      </div>
    </div>
    <header class="l-header">
      <div class="usa-overlay"></div>
      <div class="l-constrain">
        <div class="l-header__navbar">
          <div class="l-header__branding">
            <a class="site-logo" href="/" aria-label="Home" title="Home" rel="home">
              <span class="site-logo__image">
                <svg class="site-logo__svg" viewBox="0 0 1061 147" aria-hidden="true" xmlns="http://www.w3.org/2000/svg">
                  <path d="M112.8 53.5C108 72.1 89.9 86.8 69.9 86.8c-20.1 0-38-14.7-42.9-33.4h.2s9.8 10.3-.2 0c3.1 3.1 6.2 4.4 10.7 4.4s7.7-1.3 10.7-4.4c3.1 3.1 6.3 4.5 10.9 4.4 4.5 0 7.6-1.3 10.7-4.4 3.1 3.1 6.2 4.4 10.7 4.4 4.5 0 7.7-1.3 10.7-4.4 3.1 3.1 6.3 4.5 10.9 4.4 4.3 0 7.4-1.2 10.5-4.3zM113.2 43.5c0-24-19.4-43.5-43.3-43.5-24 0-43.5 19.5-43.5 43.5h39.1c-4.8-1.8-8.1-6.3-8.1-11.6 0-7 5.7-12.5 12.5-12.5 7 0 12.7 5.5 12.7 12.5 0 5.2-3.1 9.6-7.6 11.6h38.2zM72.6 139.3c.7-36.9 29.7-68.8 66.9-70 0 37.2-30 68-66.9 70zM67.1 139.3c-.7-36.9-29.7-68.8-67.1-70 0 37.2 30.2 68 67.1 70zM240 3.1h-87.9v133.1H240v-20.4h-60.3v-36H240v-21h-60.3v-35H240V3.1zM272.8 58.8h27.1c9.1 0 15.2-8.6 15.1-17.7-.1-9-6.1-17.3-15.1-17.3h-25.3v112.4h-27.8V3.1h62.3c20.2 0 35 17.8 35.2 38 .2 20.4-14.8 38.7-35.2 38.7h-36.3v-21zM315.9 136.2h29.7l12.9-35h54.2l-8.1-21.9h-38.4l18.9-50.7 39.2 107.6H454L400.9 3.1h-33.7l-51.3 133.1zM473.3.8v22.4c0 1.9.2 3.3.5 4.3s.7 1.7 1 2.2c1.2 1.4 2.5 2.4 3.9 2.9 1.5.5 2.8.7 4.1.7 2.4 0 4.2-.4 5.5-1.3 1.3-.8 2.2-1.8 2.8-2.9.6-1.1.9-2.3 1-3.4.1-1.1.1-2 .1-2.6V.8h4.7v24c0 .7-.1 1.5-.4 2.4-.3 1.8-1.2 3.6-2.5 5.4-1.8 2.1-3.8 3.5-6 4.2-2.2.6-4 .9-5.3.9-1.8 0-3.8-.3-6.2-1.1-2.4-.8-4.5-2.3-6.2-4.7-.5-.8-1-1.8-1.4-3.2-.4-1.3-.6-3.3-.6-5.9V.8h5zM507.5 14.5v-2.9l4.6.1-.1 4.1c.2-.3.4-.7.8-1.2.3-.5.8-.9 1.4-1.4.6-.5 1.4-.9 2.3-1.3.9-.3 2.1-.5 3.4-.4.6 0 1.4.1 2.4.3.9.2 1.9.6 2.9 1.2s1.8 1.5 2.4 2.6c.6 1.2.9 2.8.9 4.7l-.4 17-4.6-.1.4-16c0-.9 0-1.7-.2-2.4-.1-.7-.5-1.3-1.1-1.9-1.2-1.2-2.6-1.8-4.3-1.8-1.7 0-3.1.5-4.4 1.7-1.3 1.2-2 3.1-2.1 5.7l-.3 14.5-4.5-.1.5-22.4zM537.2.9h5.5V6h-5.5V.9m.5 10.9h4.6v25.1h-4.6V11.8zM547.8 11.7h4.3V6.4l4.5-1.5v6.8h5.4v3.4h-5.4v15.1c0 .3 0 .6.1 1 0 .4.1.7.4 1.1.2.4.5.6 1 .8.4.3 1 .4 1.8.4 1 0 1.7-.1 2.2-.2V37c-.9.2-2.1.3-3.8.3-2.1 0-3.6-.4-4.6-1.2-1-.8-1.5-2.2-1.5-4.2V15.1h-4.3v-3.4zM570.9 25.2c-.1 2.6.5 4.8 1.7 6.5 1.1 1.7 2.9 2.6 5.3 2.6 1.5 0 2.8-.4 3.9-1.3 1-.8 1.6-2.2 1.8-4h4.6c0 .6-.2 1.4-.4 2.3-.3 1-.8 2-1.7 3-.2.3-.6.6-1 1-.5.4-1 .7-1.7 1.1-.7.4-1.5.6-2.4.8-.9.3-2 .4-3.3.4-7.6-.2-11.3-4.5-11.3-12.9 0-2.5.3-4.8 1-6.8s2-3.7 3.8-5.1c1.2-.8 2.4-1.3 3.7-1.6 1.3-.2 2.2-.3 3-.3 2.7 0 4.8.6 6.3 1.6s2.5 2.3 3.1 3.9c.6 1.5 1 3.1 1.1 4.6.1 1.6.1 2.9 0 4h-17.5m12.9-3v-1.1c0-.4 0-.8-.1-1.2-.1-.9-.4-1.7-.8-2.5s-1-1.5-1.8-2c-.9-.5-2-.8-3.4-.8-.8 0-1.5.1-2.3.3-.8.2-1.5.7-2.2 1.3-.7.6-1.2 1.3-1.6 2.3-.4 1-.7 2.2-.8 3.6h13zM612.9.9h4.6V33c0 1 .1 2.3.2 4h-4.6l-.1-4c-.2.3-.4.7-.7 1.2-.3.5-.8 1-1.4 1.5-1 .7-2 1.2-3.1 1.4l-1.5.3c-.5.1-.9.1-1.4.1-.4 0-.8 0-1.3-.1s-1.1-.2-1.7-.3c-1.1-.3-2.3-.9-3.4-1.8s-2.1-2.2-2.9-3.8c-.8-1.7-1.2-3.9-1.2-6.6.1-4.8 1.2-8.3 3.4-10.5 2.1-2.1 4.7-3.2 7.6-3.2 1.3 0 2.4.2 3.4.5.9.3 1.6.7 2.2 1.2.6.4 1 .9 1.3 1.4.3.5.6.8.7 1.1V.9m0 23.1c0-1.9-.2-3.3-.5-4.4-.4-1.1-.8-2-1.4-2.6-.5-.7-1.2-1.3-2-1.8-.9-.5-2-.7-3.3-.7-1.7 0-2.9.5-3.8 1.3-.9.8-1.6 1.9-2 3.1-.4 1.2-.7 2.3-.7 3.4-.1 1.1-.2 1.9-.1 2.4 0 1.1.1 2.2.3 3.4.2 1.1.5 2.2 1 3.1.5 1 1.2 1.7 2 2.3.9.6 2 .9 3.3.9 1.8 0 3.2-.5 4.2-1.4 1-.8 1.7-1.8 2.1-3 .4-1.2.7-2.4.8-3.4.1-1.4.1-2.1.1-2.6zM643.9 26.4c0 .6.1 1.3.3 2.1.1.8.5 1.6 1 2.3.5.8 1.4 1.4 2.5 1.9s2.7.8 4.7.8c1.8 0 3.3-.3 4.4-.8 1.1-.5 1.9-1.1 2.5-1.8.6-.7 1-1.5 1.1-2.2.1-.7.2-1.2.2-1.7 0-1-.2-1.9-.5-2.6-.4-.6-.9-1.2-1.6-1.6-1.4-.8-3.4-1.4-5.9-2-4.9-1.1-8.1-2.2-9.5-3.2-1.4-1-2.3-2.2-2.9-3.5-.6-1.2-.8-2.4-.8-3.6.1-3.7 1.5-6.4 4.2-8.1 2.6-1.7 5.7-2.5 9.1-2.5 1.3 0 2.9.2 4.8.5 1.9.4 3.6 1.4 5 3 .5.5.9 1.1 1.2 1.7.3.5.5 1.1.6 1.6.2 1.1.3 2.1.3 2.9h-5c-.2-2.2-1-3.7-2.4-4.5-1.5-.7-3.1-1.1-4.9-1.1-5.1.1-7.7 2-7.8 5.8 0 1.5.5 2.7 1.6 3.5 1 .8 2.6 1.4 4.7 1.9 4 1 6.7 1.8 8.1 2.2.8.2 1.4.5 1.8.7.5.2 1 .5 1.4.9.8.5 1.4 1.1 1.9 1.8s.8 1.4 1.1 2.1c.3 1.4.5 2.5.5 3.4 0 3.3-1.2 6-3.5 8-2.3 2.1-5.8 3.2-10.3 3.3-1.4 0-3.2-.3-5.4-.8-1-.3-2-.7-3-1.2-.9-.5-1.8-1.2-2.5-2.1-.9-1.4-1.5-2.7-1.7-4.1-.3-1.3-.4-2.4-.3-3.2h5zM670 11.7h4.3V6.4l4.5-1.5v6.8h5.4v3.4h-5.4v15.1c0 .3 0 .6.1 1 0 .4.1.7.4 1.1.2.4.5.6 1 .8.4.3 1 .4 1.8.4 1 0 1.7-.1 2.2-.2V37c-.9.2-2.1.3-3.8.3-2.1 0-3.6-.4-4.6-1.2-1-.8-1.5-2.2-1.5-4.2V15.1H670v-3.4zM705.3 36.9c-.3-1.2-.5-2.5-.4-3.7-.5 1-1.1 1.8-1.7 2.4-.7.6-1.4 1.1-2 1.4-1.4.5-2.7.8-3.7.8-2.8 0-4.9-.8-6.4-2.2-1.5-1.4-2.2-3.1-2.2-5.2 0-1 .2-2.3.8-3.7.6-1.4 1.7-2.6 3.5-3.7 1.4-.7 2.9-1.2 4.5-1.5 1.6-.1 2.9-.2 3.9-.2s2.1 0 3.3.1c.1-2.9-.2-4.8-.9-5.6-.5-.6-1.1-1.1-1.9-1.3-.8-.2-1.6-.4-2.3-.4-1.1 0-2 .2-2.6.5-.7.3-1.2.7-1.5 1.2-.3.5-.5.9-.6 1.4-.1.5-.2.9-.2 1.2h-4.6c.1-.7.2-1.4.4-2.3.2-.8.6-1.6 1.3-2.5.5-.6 1-1 1.7-1.3.6-.3 1.3-.6 2-.8 1.5-.4 2.8-.6 4.2-.6 1.8 0 3.6.3 5.2.9 1.6.6 2.8 1.6 3.4 2.9.4.7.6 1.4.7 2 .1.6.1 1.2.1 1.8l-.2 12c0 1 .1 3.1.4 6.3h-4.2m-.5-12.1c-.7-.1-1.6-.1-2.6-.1h-2.1c-1 .1-2 .3-3 .6s-1.9.8-2.6 1.5c-.8.7-1.2 1.7-1.2 3 0 .4.1.8.2 1.3s.4 1 .8 1.5.9.8 1.6 1.1c.7.3 1.5.5 2.5.5 2.3 0 4.1-.9 5.2-2.7.5-.8.8-1.7 1-2.7.1-.9.2-2.2.2-4zM714.5 11.7h4.3V6.4l4.5-1.5v6.8h5.4v3.4h-5.4v15.1c0 .3 0 .6.1 1 0 .4.1.7.4 1.1.2.4.5.6 1 .8.4.3 1 .4 1.8.4 1 0 1.7-.1 2.2-.2V37c-.9.2-2.1.3-3.8.3-2.1 0-3.6-.4-4.6-1.2-1-.8-1.5-2.2-1.5-4.2V15.1h-4.3v-3.4zM737.6 25.2c-.1 2.6.5 4.8 1.7 6.5 1.1 1.7 2.9 2.6 5.3 2.6 1.5 0 2.8-.4 3.9-1.3 1-.8 1.6-2.2 1.8-4h4.6c0 .6-.2 1.4-.4 2.3-.3 1-.8 2-1.7 3-.2.3-.6.6-1 1-.5.4-1 .7-1.7 1.1-.7.4-1.5.6-2.4.8-.9.3-2 .4-3.3.4-7.6-.2-11.3-4.5-11.3-12.9 0-2.5.3-4.8 1-6.8s2-3.7 3.8-5.1c1.2-.8 2.4-1.3 3.7-1.6 1.3-.2 2.2-.3 3-.3 2.7 0 4.8.6 6.3 1.6s2.5 2.3 3.1 3.9c.6 1.5 1 3.1 1.1 4.6.1 1.6.1 2.9 0 4h-17.5m12.9-3v-1.1c0-.4 0-.8-.1-1.2-.1-.9-.4-1.7-.8-2.5s-1-1.5-1.8-2c-.9-.5-2-.8-3.4-.8-.8 0-1.5.1-2.3.3-.8.2-1.5.7-2.2 1.3-.7.6-1.2 1.3-1.6 2.3-.4 1-.7 2.2-.8 3.6h13zM765.3 29.5c0 .5.1 1 .2 1.4.1.5.4 1 .8 1.5s.9.8 1.6 1.1c.7.3 1.6.5 2.7.5 1 0 1.8-.1 2.5-.3.7-.2 1.3-.6 1.7-1.2.5-.7.8-1.5.8-2.4 0-1.2-.4-2-1.3-2.5s-2.2-.9-4.1-1.2c-1.3-.3-2.4-.6-3.6-1-1.1-.3-2.1-.8-3-1.3-.9-.5-1.5-1.2-2-2.1-.5-.8-.8-1.9-.8-3.2 0-2.4.9-4.2 2.6-5.6 1.7-1.3 4-2 6.8-2.1 1.6 0 3.3.3 5 .8 1.7.6 2.9 1.6 3.7 3.1.4 1.4.6 2.6.6 3.7h-4.6c0-1.8-.6-3-1.7-3.5-1.1-.4-2.1-.6-3.1-.6h-1c-.5 0-1.1.2-1.7.4-.6.2-1.1.5-1.5 1.1-.5.5-.7 1.2-.7 2.1 0 1.1.5 1.9 1.3 2.3.7.4 1.5.7 2.1.9 3.3.7 5.6 1.3 6.9 1.8 1.3.4 2.2 1 2.8 1.7.7.7 1.1 1.4 1.4 2.2.3.8.4 1.6.4 2.5 0 1.4-.3 2.7-.9 3.8-.6 1.1-1.4 2-2.4 2.6-1.1.6-2.2 1-3.4 1.3-1.2.3-2.5.4-3.8.4-2.5 0-4.7-.6-6.6-1.8-1.8-1.2-2.8-3.3-2.9-6.3h5.2zM467.7 50.8h21.9V55h-17.1v11.3h16.3v4.2h-16.3v12.1H490v4.3h-22.3zM499 64.7l-.1-2.9h4.6v4.1c.2-.3.4-.8.7-1.2.3-.5.8-1 1.3-1.5.6-.5 1.4-1 2.3-1.3.9-.3 2-.5 3.4-.5.6 0 1.4.1 2.4.2.9.2 1.9.5 2.9 1.1 1 .6 1.8 1.4 2.5 2.5.6 1.2 1 2.7 1 4.7V87h-4.6V71c0-.9-.1-1.7-.2-2.4-.2-.7-.5-1.3-1.1-1.9-1.2-1.1-2.6-1.7-4.3-1.7-1.7 0-3.1.6-4.3 1.8-1.3 1.2-2 3.1-2 5.7V87H499V64.7zM524.6 61.8h5.1l7.7 19.9 7.6-19.9h5l-10.6 25.1h-4.6zM555.7 50.9h5.5V56h-5.5v-5.1m.5 10.9h4.6v25.1h-4.6V61.8zM570.3 67c0-1.8-.1-3.5-.3-5.1h4.6l.1 4.9c.5-1.8 1.4-3 2.5-3.7 1.1-.7 2.2-1.2 3.3-1.3 1.4-.2 2.4-.2 3.1-.1v4.6c-.2-.1-.5-.2-.9-.2h-1.3c-1.3 0-2.4.2-3.3.5-.9.4-1.5.9-2 1.6-.9 1.4-1.4 3.2-1.3 5.4v13.3h-4.6V67zM587.6 74.7c0-1.6.2-3.2.6-4.8.4-1.6 1.1-3 2-4.4 1-1.3 2.2-2.4 3.8-3.2 1.6-.8 3.6-1.2 5.9-1.2 2.4 0 4.5.4 6.1 1.3 1.5.9 2.7 2 3.6 3.3.9 1.3 1.5 2.8 1.8 4.3.2.8.3 1.5.4 2.2v2.2c0 3.7-1 6.9-3 9.5-2 2.6-5.1 4-9.3 4-4-.1-7-1.4-9-3.9-1.9-2.5-2.9-5.6-2.9-9.3m4.8-.3c0 2.7.6 5 1.8 6.9 1.2 2 3 3 5.6 3.1.9 0 1.8-.2 2.7-.5.8-.3 1.6-.9 2.3-1.7.7-.8 1.3-1.9 1.8-3.2.4-1.3.6-2.9.6-4.7-.1-6.4-2.5-9.6-7.1-9.6-.7 0-1.5.1-2.4.3-.8.3-1.7.8-2.5 1.6-.8.7-1.4 1.7-1.9 3-.6 1.1-.9 2.8-.9 4.8zM620.2 64.7l-.1-2.9h4.6v4.1c.2-.3.4-.8.7-1.2.3-.5.8-1 1.3-1.5.6-.5 1.4-1 2.3-1.3.9-.3 2-.5 3.4-.5.6 0 1.4.1 2.4.2.9.2 1.9.5 2.9 1.1 1 .6 1.8 1.4 2.5 2.5.6 1.2 1 2.7 1 4.7V87h-4.6V71c0-.9-.1-1.7-.2-2.4-.2-.7-.5-1.3-1.1-1.9-1.2-1.1-2.6-1.7-4.3-1.7-1.7 0-3.1.6-4.3 1.8-1.3 1.2-2 3.1-2 5.7V87h-4.6V64.7zM650 65.1l-.1-3.3h4.6v3.6c1.2-1.9 2.6-3.2 4.1-3.7 1.5-.4 2.7-.6 3.8-.6 1.4 0 2.6.2 3.6.5.9.3 1.7.7 2.3 1.1 1.1 1 1.9 2 2.3 3.1.2-.4.5-.8 1-1.3.4-.5.9-1 1.5-1.6.6-.5 1.5-.9 2.5-1.3 1-.3 2.2-.5 3.5-.5.9 0 1.9.1 3 .3 1 .2 2 .7 3 1.3 1 .6 1.7 1.5 2.3 2.7.6 1.2.9 2.7.9 4.6v16.9h-4.6V70.7c0-1.1-.1-2-.2-2.5-.1-.6-.3-1-.6-1.3-.4-.6-1-1.2-1.8-1.6-.8-.4-1.8-.6-3.1-.6-1.5 0-2.7.4-3.6 1-.4.3-.8.5-1.1.9l-.8.8c-.5.8-.8 1.8-1 2.8-.1 1.1-.2 2-.1 2.6v14.1h-4.6V70.2c0-1.6-.5-2.9-1.4-4-.9-1-2.3-1.5-4.2-1.5-1.6 0-2.9.4-3.8 1.1-.9.7-1.5 1.2-1.8 1.7-.5.7-.8 1.5-.9 2.5-.1.9-.2 1.8-.2 2.6v14.3H650V65.1zM700.5 75.2c-.1 2.6.5 4.8 1.7 6.5 1.1 1.7 2.9 2.6 5.3 2.6 1.5 0 2.8-.4 3.9-1.3 1-.8 1.6-2.2 1.8-4h4.6c0 .6-.2 1.4-.4 2.3-.3 1-.8 2-1.7 3-.2.3-.6.6-1 1-.5.4-1 .7-1.7 1.1-.7.4-1.5.6-2.4.8-.9.3-2 .4-3.3.4-7.6-.2-11.3-4.5-11.3-12.9 0-2.5.3-4.8 1-6.8s2-3.7 3.8-5.1c1.2-.8 2.4-1.3 3.7-1.6 1.3-.2 2.2-.3 3-.3 2.7 0 4.8.6 6.3 1.6s2.5 2.3 3.1 3.9c.6 1.5 1 3.1 1.1 4.6.1 1.6.1 2.9 0 4h-17.5m12.8-3v-1.1c0-.4 0-.8-.1-1.2-.1-.9-.4-1.7-.8-2.5s-1-1.5-1.8-2c-.9-.5-2-.8-3.4-.8-.8 0-1.5.1-2.3.3-.8.2-1.5.7-2.2 1.3-.7.6-1.2 1.3-1.6 2.3-.4 1-.7 2.2-.8 3.6h13zM725.7 64.7l-.1-2.9h4.6v4.1c.2-.3.4-.8.7-1.2.3-.5.8-1 1.3-1.5.6-.5 1.4-1 2.3-1.3.9-.3 2-.5 3.4-.5.6 0 1.4.1 2.4.2.9.2 1.9.5 2.9 1.1 1 .6 1.8 1.4 2.5 2.5.6 1.2 1 2.7 1 4.7V87h-4.6V71c0-.9-.1-1.7-.2-2.4-.2-.7-.5-1.3-1.1-1.9-1.2-1.1-2.6-1.7-4.3-1.7-1.7 0-3.1.6-4.3 1.8-1.3 1.2-2 3.1-2 5.7V87h-4.6V64.7zM752.3 61.7h4.3v-5.2l4.5-1.5v6.8h5.4v3.4h-5.4v15.1c0 .3 0 .6.1 1 0 .4.1.7.4 1.1.2.4.5.6 1 .8.4.3 1 .4 1.8.4 1 0 1.7-.1 2.2-.2V87c-.9.2-2.1.3-3.8.3-2.1 0-3.6-.4-4.6-1.2-1-.8-1.5-2.2-1.5-4.2V65.1h-4.3v-3.4zM787.6 86.9c-.3-1.2-.5-2.5-.4-3.7-.5 1-1.1 1.8-1.7 2.4-.7.6-1.4 1.1-2 1.4-1.4.5-2.7.8-3.7.8-2.8 0-4.9-.8-6.4-2.2-1.5-1.4-2.2-3.1-2.2-5.2 0-1 .2-2.3.8-3.7.6-1.4 1.7-2.6 3.5-3.7 1.4-.7 2.9-1.2 4.5-1.5 1.6-.1 2.9-.2 3.9-.2s2.1 0 3.3.1c.1-2.9-.2-4.8-.9-5.6-.5-.6-1.1-1.1-1.9-1.3-.8-.2-1.6-.4-2.3-.4-1.1 0-2 .2-2.6.5-.7.3-1.2.7-1.5 1.2-.3.5-.5.9-.6 1.4-.1.5-.2.9-.2 1.2h-4.6c.1-.7.2-1.4.4-2.3.2-.8.6-1.6 1.3-2.5.5-.6 1-1 1.7-1.3.6-.3 1.3-.6 2-.8 1.5-.4 2.8-.6 4.2-.6 1.8 0 3.6.3 5.2.9 1.6.6 2.8 1.6 3.4 2.9.4.7.6 1.4.7 2 .1.6.1 1.2.1 1.8l-.2 12c0 1 .1 3.1.4 6.3h-4.2m-.5-12.1c-.7-.1-1.6-.1-2.6-.1h-2.1c-1 .1-2 .3-3 .6s-1.9.8-2.6 1.5c-.8.7-1.2 1.7-1.2 3 0 .4.1.8.2 1.3s.4 1 .8 1.5.9.8 1.6 1.1c.7.3 1.5.5 2.5.5 2.3 0 4.1-.9 5.2-2.7.5-.8.8-1.7 1-2.7.1-.9.2-2.2.2-4zM800.7 50.9h4.6V87h-4.6zM828.4 50.8h11.7c2.1 0 3.9.1 5.5.4.8.2 1.5.4 2.2.9.7.4 1.3.9 1.8 1.6 1.7 1.9 2.6 4.2 2.6 7 0 2.7-.9 5.1-2.8 7.1-.8.9-2 1.7-3.6 2.2-1.6.6-3.9.9-6.9.9h-5.7V87h-4.8V50.8m4.8 15.9h5.8c.8 0 1.7-.1 2.6-.2.9-.1 1.8-.3 2.6-.7.8-.4 1.5-1 2-1.9.5-.8.8-2 .8-3.4s-.2-2.5-.7-3.3c-.5-.8-1.1-1.3-1.9-1.7-1.6-.5-3.1-.8-4.5-.7h-6.8v11.9zM858.1 67c0-1.8-.1-3.5-.3-5.1h4.6l.1 4.9c.5-1.8 1.4-3 2.5-3.7 1.1-.7 2.2-1.2 3.3-1.3 1.4-.2 2.4-.2 3.1-.1v4.6c-.2-.1-.5-.2-.9-.2h-1.3c-1.3 0-2.4.2-3.3.5-.9.4-1.5.9-2 1.6-.9 1.4-1.4 3.2-1.3 5.4v13.3H858V67zM875.5 74.7c0-1.6.2-3.2.6-4.8.4-1.6 1.1-3 2-4.4 1-1.3 2.2-2.4 3.8-3.2 1.6-.8 3.6-1.2 5.9-1.2 2.4 0 4.5.4 6.1 1.3 1.5.9 2.7 2 3.6 3.3.9 1.3 1.5 2.8 1.8 4.3.2.8.3 1.5.4 2.2v2.2c0 3.7-1 6.9-3 9.5-2 2.6-5.1 4-9.3 4-4-.1-7-1.4-9-3.9-1.9-2.5-2.9-5.6-2.9-9.3m4.8-.3c0 2.7.6 5 1.8 6.9 1.2 2 3 3 5.6 3.1.9 0 1.8-.2 2.7-.5.8-.3 1.6-.9 2.3-1.7.7-.8 1.3-1.9 1.8-3.2.4-1.3.6-2.9.6-4.7-.1-6.4-2.5-9.6-7.1-9.6-.7 0-1.5.1-2.4.3-.8.3-1.7.8-2.5 1.6-.8.7-1.4 1.7-1.9 3-.7 1.1-.9 2.8-.9 4.8zM904.1 61.7h4.3v-5.2l4.5-1.5v6.8h5.4v3.4h-5.4v15.1c0 .3 0 .6.1 1 0 .4.1.7.4 1.1.2.4.5.6 1 .8.4.3 1 .4 1.8.4 1 0 1.7-.1 2.2-.2V87c-.9.2-2.1.3-3.8.3-2.1 0-3.6-.4-4.6-1.2-1-.8-1.5-2.2-1.5-4.2V65.1h-4.3v-3.4zM927.2 75.2c-.1 2.6.5 4.8 1.7 6.5 1.1 1.7 2.9 2.6 5.3 2.6 1.5 0 2.8-.4 3.9-1.3 1-.8 1.6-2.2 1.8-4h4.6c0 .6-.2 1.4-.4 2.3-.3 1-.8 2-1.7 3-.2.3-.6.6-1 1-.5.4-1 .7-1.7 1.1-.7.4-1.5.6-2.4.8-.9.3-2 .4-3.3.4-7.6-.2-11.3-4.5-11.3-12.9 0-2.5.3-4.8 1-6.8s2-3.7 3.8-5.1c1.2-.8 2.4-1.3 3.7-1.6 1.3-.2 2.2-.3 3-.3 2.7 0 4.8.6 6.3 1.6s2.5 2.3 3.1 3.9c.6 1.5 1 3.1 1.1 4.6.1 1.6.1 2.9 0 4h-17.5m12.9-3v-1.1c0-.4 0-.8-.1-1.2-.1-.9-.4-1.7-.8-2.5s-1-1.5-1.8-2c-.9-.5-2-.8-3.4-.8-.8 0-1.5.1-2.3.3-.8.2-1.5.7-2.2 1.3-.7.6-1.2 1.3-1.6 2.3-.4 1-.7 2.2-.8 3.6h13zM966.1 69.8c0-.3 0-.8-.1-1.4-.1-.6-.3-1.1-.6-1.8-.2-.6-.7-1.2-1.4-1.6-.7-.4-1.6-.6-2.7-.6-1.5 0-2.7.4-3.5 1.2-.9.8-1.5 1.7-1.9 2.8-.4 1.1-.6 2.2-.7 3.2-.1 1.1-.2 1.8-.1 2.4 0 1.3.1 2.5.3 3.7.2 1.2.5 2.3.9 3.3.8 2 2.4 3 4.8 3.1 1.9 0 3.3-.7 4.1-1.9.8-1.1 1.2-2.3 1.2-3.6h4.6c-.2 2.5-1.1 4.6-2.7 6.3-1.7 1.8-4.1 2.7-7.1 2.7-.9 0-2.1-.2-3.6-.6-.7-.2-1.4-.6-2.2-1-.8-.4-1.5-1-2.2-1.7-.7-.9-1.4-2.1-2-3.6-.6-1.5-.9-3.5-.9-6.1 0-2.6.4-4.8 1.1-6.6.7-1.7 1.6-3.1 2.7-4.2 1.1-1 2.3-1.8 3.6-2.2 1.3-.4 2.5-.6 3.7-.6h1.6c.6.1 1.3.2 1.9.4.7.2 1.4.5 2.1 1 .7.4 1.3 1 1.8 1.7.9 1.1 1.4 2.1 1.7 3.1.2 1 .3 1.8.3 2.6h-4.7zM973.6 61.7h4.3v-5.2l4.5-1.5v6.8h5.4v3.4h-5.4v15.1c0 .3 0 .6.1 1 0 .4.1.7.4 1.1.2.4.5.6 1 .8.4.3 1 .4 1.8.4 1 0 1.7-.1 2.2-.2V87c-.9.2-2.1.3-3.8.3-2.1 0-3.6-.4-4.6-1.2-1-.8-1.5-2.2-1.5-4.2V65.1h-4.3v-3.4zM993.5 50.9h5.5V56h-5.5v-5.1m.5 10.9h4.6v25.1H994V61.8zM1006.1 74.7c0-1.6.2-3.2.6-4.8.4-1.6 1.1-3 2-4.4 1-1.3 2.2-2.4 3.8-3.2 1.6-.8 3.6-1.2 5.9-1.2 2.4 0 4.5.4 6.1 1.3 1.5.9 2.7 2 3.6 3.3.9 1.3 1.5 2.8 1.8 4.3.2.8.3 1.5.4 2.2v2.2c0 3.7-1 6.9-3 9.5-2 2.6-5.1 4-9.3 4-4-.1-7-1.4-9-3.9-1.9-2.5-2.9-5.6-2.9-9.3m4.7-.3c0 2.7.6 5 1.8 6.9 1.2 2 3 3 5.6 3.1.9 0 1.8-.2 2.7-.5.8-.3 1.6-.9 2.3-1.7.7-.8 1.3-1.9 1.8-3.2.4-1.3.6-2.9.6-4.7-.1-6.4-2.5-9.6-7.1-9.6-.7 0-1.5.1-2.4.3-.8.3-1.7.8-2.5 1.6-.8.7-1.4 1.7-1.9 3-.6 1.1-.9 2.8-.9 4.8zM1038.6 64.7l-.1-2.9h4.6v4.1c.2-.3.4-.8.7-1.2.3-.5.8-1 1.3-1.5.6-.5 1.4-1 2.3-1.3.9-.3 2-.5 3.4-.5.6 0 1.4.1 2.4.2.9.2 1.9.5 2.9 1.1 1 .6 1.8 1.4 2.5 2.5.6 1.2 1 2.7 1 4.7V87h-4.6V71c0-.9-.1-1.7-.2-2.4-.2-.7-.5-1.3-1.1-1.9-1.2-1.1-2.6-1.7-4.3-1.7-1.7 0-3.1.6-4.3 1.8-1.3 1.2-2 3.1-2 5.7V87h-4.6V64.7zM479.1 100.8h5.2l14.1 36.1h-5.3l-3.8-9.4h-16.2l-3.8 9.4h-5l14.8-36.1m-4.4 22.7H488l-6.5-17.8-6.8 17.8zM508.7 138.8c.1.7.2 1.4.4 1.9.2.6.5 1.1.9 1.6.8.9 2.3 1.4 4.4 1.5 1.6 0 2.8-.3 3.7-.9.9-.6 1.5-1.4 1.9-2.4.4-1.1.6-2.3.7-3.7.1-1.4.1-2.9.1-4.6-.5.9-1.1 1.7-1.8 2.3-.7.6-1.5 1-2.3 1.3-1.7.4-3 .6-3.9.6-1.2 0-2.4-.2-3.8-.6-1.4-.4-2.6-1.2-3.7-2.5-1-1.3-1.7-2.8-2.1-4.4-.4-1.6-.6-3.2-.6-4.8 0-4.3 1.1-7.4 3.2-9.5 2-2.1 4.6-3.1 7.6-3.1 1.3 0 2.3.1 3.2.4.9.3 1.6.6 2.1 1 .6.4 1.1.8 1.5 1.2l.9 1.2v-3.4h4.4l-.1 4.5v15.7c0 2.9-.1 5.2-.2 6.7-.2 1.6-.5 2.8-1 3.7-1.1 1.9-2.6 3.2-4.6 3.7-1.9.6-3.8.8-5.6.8-2.4 0-4.3-.3-5.6-.8-1.4-.5-2.4-1.2-3-2-.6-.8-1-1.7-1.2-2.7-.2-.9-.3-1.8-.4-2.7h4.9m5.3-5.8c1.4 0 2.5-.2 3.3-.7.8-.5 1.5-1.1 2-1.8.5-.6.9-1.4 1.2-2.5.3-1 .4-2.6.4-4.8 0-1.6-.2-2.9-.4-3.9-.3-1-.8-1.8-1.4-2.4-1.3-1.4-3-2.2-5.2-2.2-1.4 0-2.5.3-3.4 1-.9.7-1.6 1.5-2 2.4-.4 1-.7 2-.9 3-.2 1-.2 2-.2 2.8 0 1 .1 1.9.3 2.9.2 1.1.5 2.1 1 3 .5.9 1.2 1.6 2 2.2.8.7 1.9 1 3.3 1zM537.6 125.2c-.1 2.6.5 4.8 1.7 6.5 1.1 1.7 2.9 2.6 5.3 2.6 1.5 0 2.8-.4 3.9-1.3 1-.8 1.6-2.2 1.8-4h4.6c0 .6-.2 1.4-.4 2.3-.3 1-.8 2-1.7 3-.2.3-.6.6-1 1-.5.4-1 .7-1.7 1.1-.7.4-1.5.6-2.4.8-.9.3-2 .4-3.3.4-7.6-.2-11.3-4.5-11.3-12.9 0-2.5.3-4.8 1-6.8s2-3.7 3.8-5.1c1.2-.8 2.4-1.3 3.7-1.6 1.3-.2 2.2-.3 3-.3 2.7 0 4.8.6 6.3 1.6s2.5 2.3 3.1 3.9c.6 1.5 1 3.1 1.1 4.6.1 1.6.1 2.9 0 4h-17.5m12.9-3v-1.1c0-.4 0-.8-.1-1.2-.1-.9-.4-1.7-.8-2.5s-1-1.5-1.8-2.1c-.9-.5-2-.8-3.4-.8-.8 0-1.5.1-2.3.3-.8.2-1.5.7-2.2 1.3-.7.6-1.2 1.3-1.6 2.3-.4 1-.7 2.2-.8 3.7h13zM562.9 114.7l-.1-2.9h4.6v4.1c.2-.3.4-.8.7-1.2.3-.5.8-1 1.3-1.5.6-.5 1.4-1 2.3-1.3.9-.3 2-.5 3.4-.5.6 0 1.4.1 2.4.2.9.2 1.9.5 2.9 1.1 1 .6 1.8 1.4 2.5 2.5.6 1.2 1 2.7 1 4.7V137h-4.6v-16c0-.9-.1-1.7-.2-2.4-.2-.7-.5-1.3-1.1-1.9-1.2-1.1-2.6-1.7-4.3-1.7-1.7 0-3.1.6-4.3 1.8-1.3 1.2-2 3.1-2 5.7V137h-4.6v-22.3zM607 119.8c0-.3 0-.8-.1-1.4-.1-.6-.3-1.1-.6-1.8-.2-.6-.7-1.2-1.4-1.6-.7-.4-1.6-.6-2.7-.6-1.5 0-2.7.4-3.5 1.2-.9.8-1.5 1.7-1.9 2.8-.4 1.1-.6 2.2-.7 3.2-.1 1.1-.2 1.8-.1 2.4 0 1.3.1 2.5.3 3.7.2 1.2.5 2.3.9 3.3.8 2 2.4 3 4.8 3.1 1.9 0 3.3-.7 4.1-1.9.8-1.1 1.2-2.3 1.2-3.6h4.6c-.2 2.5-1.1 4.6-2.7 6.3-1.7 1.8-4.1 2.7-7.1 2.7-.9 0-2.1-.2-3.6-.6-.7-.2-1.4-.6-2.2-1-.8-.4-1.5-1-2.2-1.7-.7-.9-1.4-2.1-2-3.6-.6-1.5-.9-3.5-.9-6.1 0-2.6.4-4.8 1.1-6.6.7-1.7 1.6-3.1 2.7-4.2 1.1-1 2.3-1.8 3.6-2.2 1.3-.4 2.5-.6 3.7-.6h1.6c.6.1 1.3.2 1.9.4.7.2 1.4.5 2.1 1 .7.4 1.3 1 1.8 1.7.9 1.1 1.4 2.1 1.7 3.1.2 1 .3 1.8.3 2.6H607zM629.1 137.1l-3.4 9.3H621l3.8-9.6-10.3-25h5.2l7.6 19.8 7.7-19.8h5z"/>
                </svg>
              </span>
            </a>
            <button class="usa-menu-btn usa-button l-header__menu-button">Menu</button>
          </div>
          <div class="l-header__search">
            <form class="usa-search usa-search--small usa-search--epa" method="get" action="https://search.epa.gov/epasearch">
              <div role="search">
                <label class="usa-sr-only" for="search-box">Search</label>
                <input class="usa-input" id="search-box" type="search" name="querytext" placeholder="Search EPA.gov">
                <!-- button class="usa-button" type="submit" --> <!-- type="submit" - removed for now to allow other unrendered buttons to render when triggered in RShiny app -->
                <!-- see: https://github.com/rstudio/shiny/issues/2922 -->
                <button class="usa-button usa-search__submit" style="height:2rem;margin:0;padding:0;padding-left:1rem;padding-right:1rem;border-top-left-radius: 0;border-bottom-left-radius: 0;">
                  <span class="usa-sr-only">Search</span>
                </button>
                <input type="hidden" name="areaname" value="">
                <input type="hidden" name="areacontacts" value="">
                <input type="hidden" name="areasearchurl" value="">
                <input type="hidden" name="typeofsearch" value="epa">
                <input type="hidden" name="result_template" value="">
              </div>
            </form>
          </div>
        </div>
      </div>
      <div class="l-header__nav">
        <nav class="usa-nav usa-nav--epa" role="navigation" aria-label="EPA header navigation">
          <div class="usa-nav__inner">
            <button class="usa-nav__close" aria-label="Close">
              <svg class="icon icon--nav-close" aria-hidden="true" role="img">
                <title>Primary navigation</title>
                <use xlink:href="https://www.epa.gov/themes/epa_theme/images/sprite.artifact.svg#close"></use>
              </svg> </button>
            <div class="usa-nav__menu">
               <ul class="menu menu--main">
                <li class="menu__item"><a href="https://www.epa.gov/environmental-topics" class="menu__link">Environmental Topics</a></li>
                <li class="menu__item"><a href="https://www.epa.gov/laws-regulations" class="menu__link" >Laws &amp; Regulations</a></li>
                <li class="menu__item"><a href="https://www.epa.gov/report-violation" class="menu__link" >Report a Violation</a></li>
                <li class="menu__item"><a href="https://www.epa.gov/aboutepa" class="menu__link" >About EPA</a></li>
              </ul>
            </div>
          </div>
        </nav>
      </div>
    </header>
    <main id="main" class="main" role="main" tabindex="-1">'
  ),
  
  # Individual Page Header
  HTML(
    '<div class="l-page  has-footer">
      <div class="l-constrain">
        <div class="l-page__header">
          <div class="l-page__header-first">
            <div class="web-area-title"></div>
          </div>
          <div class="l-page__header-last">
            <a href="#" class="header-link">Contact Us</a>
          </div>
        </div>
        <article class="article">'
  ),
  
	# Insert your UI code here
		## Begin example UI code
			titlePanel(
        div(
            class="jumbotron",
            h2(HTML(
                "Web application for the Final Streamflow Duration Assessment Methods 
        ")
            ),
            h4(HTML("<p>Version <a href=\"https://github.com/WSaulnier/beta_sdam_nese/tree/beta_sdam_nese_v1_1\">1.1</a> Release date: November 2023 </p>")),
            img(src="eph.jpg", style = "height: 400px"),
            img(src="int.jpg", style = "height: 400px"),
            img(src="per.jpg", style = "height: 400px")
        ),
        "SDAMs"
    
    ),
    fluidRow(
      
        column(
            10,
            tabsetPanel(
                id = "tabs",
                
                # tabPanel(
                #     "Background Info",
                #     bkgrnd
                # ),
                # Overview -----------------------------------------------------
                tabPanel(
                  
                    # style = 'background-color: #8a8f96;',
                    "Enter Data", 
                    br(),
                    
                    fluidRow(
                      column(1),
                      column(10, 
                        h4(p(HTML("<b><u><i>This is an analysis tool and does not store data. After 60 minutes the tool will timeout and all data will have to be re-entered.</i></u></b>"),style="color:#b80404")),
                        h3("Step 1: Enter reach coordinates or select reach location on map."), 
                      )
                    ),
                    # coordinates----
                    fluidRow(
                      column(1),
                      column(10,
                             selectInput(
                               "vol_region",
                               label = HTML("<b><i>Method for Assessing Reach Location</b></i>"),
                               choices = c(
                                 "Enter Coordinates",
                                 "Select Region",
                                 "Select Location on Map"
                               ),
                               selected = "No",
                               width = '20%'
                             )
                      )
                    ),
                    fluidRow(
                        column(1),
                        column(7,
                               HTML('<hr style="color: black; height: 1px; background-color: black;">')
                               )
                    ),
                    
                    conditionalPanel(
                        
                      condition = "input.vol_region == 'Enter Coordinates'",
                      fluidRow(
                          column(1),
                          column(
                              6,
                              div(HTML('<b><i>Enter coordinates in decimal degrees to determine if the site is in a SDAM study area. </i></b>')),
                              div(id = "placeholder"),
                              div(id = "coords",
                                fluidRow(
                                    column(4,
                                           numericInput("lat", label = NULL, value = 40)),
                                    column(4, h5("Latitude"))
                                ),
                                fluidRow(
                                    column(4,numericInput("lon", label = NULL, value = -120)),
                                    column(4, h5("Longitude"))
                                ),
                                fluidRow(
                                    column(4,
                                            br(),
                                            div(actionButton("reg_button", 
                                                            label=div("Assess Reach Location", icon('long-arrow-right'))
                                                            ) 
                                              ),
                                            br(), br(),

                                          )
                                )
                              )
                          ),
                          column(
                              4,
                              conditionalPanel(
                                  condition = "input.reg_button != 0",
                                  
                                  uiOutput(outputId = "reg_class") %>%
                                      tagAppendAttributes(class = 'border-my-text')
                              )
                          )
                      )
                    ),
                    
                    ## select region via dropdown menu----
                    conditionalPanel(
                      condition = "input.vol_region == 'Select Region'",
                      fluidRow(
                        column(1),
                        column(10,
                               selectInput(
                                 "user_region",
                                 HTML("<b><i>Select SDAM Region if not entering coordinates:</b></i>"),
                                 c(
                                    "No Region Selected" = "No Region",
                                    "Arid West" = "Arid West",  
                                    "East" = "East",
                                    "Great Plains" = "Great Plains",
                                    "Pacific Northwest" = "Pacific Northwest",
                                    "Western Mountains" = "Western Mountains"
                                 )
                               )
                        )
                      )
                    ),
                    
                    ## leaflet map----
                    conditionalPanel(
                        condition = "input.vol_region == 'Select Location on Map'",
                        fluidRow(
                            column(2),
                            column(8,
                                leafletOutput("map", height ='600px'),
                                br(),
                                br()
                            )
                        )
                    ),

                    fluidRow(
                        column(1),
                        column(
                            10,
                            HTML('<hr style="color: black; height: 7px; background-color: black;">')
                        )
                    ),

                    fluidRow(
                        column(1),
                        column(4,
                                br(),
                                div(actionButton("indicator_button", 
                                                label=div("Enter Model Data", icon('arrow-down'))
                                                ) 
                                    ),
                                br(),
                                br(),
                                    
                              )
                              ),
                    
                    # Region UI Split-----
                    conditionalPanel(
                      condition = "input.indicator_button != 0",
                      uiOutput("regionPanel") 
                    ),
                    # uiOutput("regionPanel"),
                    uiOutput("reportPanel"),
                      
                    
                ),
                tabPanel(
                    "Additional Resources",
                    addinfo
                )
                
            )
        )
      
    )
		## End example UI code
  
  # IMPORTANT! For a navbar page, you will need to place the header and footer inside the navbar section (as shown below)  -
  # you will then want to comment out lines 201-213 and lines 254-263
#   navbarPage(
#     title = h2("Sample App"),
#     header = HTML(
#       '<div class="l-page  has-footer">
#         <div class="l-constrain">
#           <div class="l-page__header">
#             <div class="l-page__header-first">
#               <div class="web-area-title"></div>
#             </div>
#             <div class="l-page__header-last">
#               <a href="#" class="header-link">Contact Us</a>
#             </div>
#           </div>
#           <article class="article">'
#     ),
#     footer = HTML(
#       '</article>
# 	        </div>
#           <div class="l-page__footer">
#             <div class="l-constrain">
#               <p><a href="#">Contact Us</a> to ask a question, provide feedback, or report a problem.</p>
#             </div>
#           </div>
#         </div>'
#     ),
#     tabPanel("Sample Tab 1"),
#     tabPanel("Sample Tab 2"),
#   ),
  
  # Individual Page Footer
  ,HTML(
    '</article>
    </div>
    <div class="l-page__footer">
      <div class="l-constrain">
        <p><a href="#">Contact Us</a> to ask a question, provide feedback, or report a problem.</p>
      </div>
    </div>
  </div>'
  ),
  
	# Site Footer
	HTML(
	  '</main>
      <footer class="footer" role="contentinfo">
      <div class="l-constrain">
        <img class="footer__epa-seal" src="https://www.epa.gov/themes/epa_theme/images/epa-seal.svg" alt="United States Environmental Protection Agency" height="100" width="100">
        <div class="footer__content contextual-region">
          <div class="footer__column">
            <h2>Discover.</h2>
            <ul class="menu menu--footer">
              <li class="menu__item">
                <a href="https://www.epa.gov/accessibility" class="menu__link">Accessibility</a>
              </li>
              <!--li class="menu__item"><a href="#" class="menu__link">EPA Administrator</a></li-->
              <li class="menu__item">
                <a href="https://www.epa.gov/planandbudget" class="menu__link">Budget &amp; Performance</a>
              </li>
              <li class="menu__item">
                <a href="https://www.epa.gov/contracts" class="menu__link">Contracting</a>
              </li>
              <li class="menu__item">
                <a href="https://www.epa.gov/home/wwwepagov-snapshots" class="menu__link">EPA www Web Snapshot</a>
              </li>
              <li class="menu__item">
                <a href="https://www.epa.gov/grants" class="menu__link">Grants</a>
              </li>
              <li class="menu__item">
                <a href="https://www.epa.gov/ocr/whistleblower-protections-epa-and-how-they-relate-non-disclosure-agreements-signed-epa-employees" class="menu__link">No FEAR Act Data</a>
              </li>
              <li class="menu__item">
                <a href="https://www.epa.gov/web-policies-and-procedures/plain-writing" class="menu__link">Plain Writing</a>
              </li>
              <li class="menu__item">
                <a href="https://www.epa.gov/privacy" class="menu__link">Privacy</a>
              </li>
              <li class="menu__item">
                <a href="https://www.epa.gov/privacy/privacy-and-security-notice" class="menu__link">Privacy and Security Notice</a>
              </li>
            </ul>
          </div>
          <div class="footer__column">
            <h2>Connect.</h2>
            <ul class="menu menu--footer">
              <li class="menu__item">
                <a href="https://www.data.gov/" class="menu__link">Data.gov</a>
              </li>
              <li class="menu__item">
                <a href="https://www.epa.gov/office-inspector-general/about-epas-office-inspector-general" class="menu__link">Inspector General</a>
              </li>
              <li class="menu__item">
                <a href="https://www.epa.gov/careers" class="menu__link">Jobs</a>
              </li>
              <li class="menu__item">
                <a href="https://www.epa.gov/newsroom" class="menu__link">Newsroom</a>
              </li>
              <li class="menu__item">
                <a href="https://www.epa.gov/data" class="menu__link">Open Government</a>
              </li>
              <li class="menu__item">
                <a href="https://www.regulations.gov/" class="menu__link">Regulations.gov</a>
              </li>
              <li class="menu__item">
                <a href="https://www.epa.gov/newsroom/email-subscriptions-epa-news-releases" class="menu__link">Subscribe</a>
              </li>
              <li class="menu__item">
                <a href="https://www.usa.gov/" class="menu__link">USA.gov</a>
              </li>
              <li class="menu__item">
                <a href="https://www.whitehouse.gov/" class="menu__link">White House</a>
              </li>
            </ul>
          </div>
          <div class="footer__column">
            <h2>Ask.</h2>
            <ul class="menu menu--footer">
              <li class="menu__item">
                <a href="https://www.epa.gov/home/forms/contact-epa" class="menu__link">Contact EPA</a>
              </li>
              <li class="menu__item">
                <a href="https://www.epa.gov/web-policies-and-procedures/epa-disclaimers" class="menu__link">EPA Disclaimers</a>
              </li>
              <li class="menu__item">
                <a href="https://www.epa.gov/aboutepa/epa-hotlines" class="menu__link">Hotlines</a>
              </li>
              <li class="menu__item">
                <a href="https://www.epa.gov/foia" class="menu__link">FOIA Requests</a>
              </li>
              <li class="menu__item">
                <a href="https://www.epa.gov/home/frequent-questions-specific-epa-programstopics" class="menu__link">Frequent Questions</a>
              </li>
            </ul>
            <h2>Follow.</h2>
            <ul class="menu menu--social">
              <li class="menu__item">
                <a class="menu__link" aria-label="EPA’s Facebook" href="https://www.facebook.com/EPA">
                  <!-- svg class="icon icon--social" aria-hidden="true" -->
                  <svg class="icon icon--social" aria-hidden="true" viewBox="0 0 448 512" id="facebook-square" xmlns="http://www.w3.org/2000/svg">
                    <!-- use xlink:href="https://www.epa.gov/themes/epa_theme/images/sprite.artifact.svg#facebook-square"></use-->
                    <path fill="currentcolor" d="M400 32H48A48 48 0 000 80v352a48 48 0 0048 48h137.25V327.69h-63V256h63v-54.64c0-62.15 37-96.48 93.67-96.48 27.14 0 55.52 4.84 55.52 4.84v61h-31.27c-30.81 0-40.42 19.12-40.42 38.73V256h68.78l-11 71.69h-57.78V480H400a48 48 0 0048-48V80a48 48 0 00-48-48z"></path>
                  </svg> 
                  <span class="usa-tag external-link__tag" title="Exit EPA Website">
                    <span aria-hidden="true">Exit</span>
                    <span class="u-visually-hidden"> Exit EPA Website</span>
                  </span>
                </a>
              </li>
              <li class="menu__item">
                <a class="menu__link" aria-label="EPA’s Twitter" href="https://twitter.com/epa">
                  <!-- svg class="icon icon--social" aria-hidden="true" -->
                  <svg class="icon icon--social" aria-hidden="true" viewBox="0 0 448 512" id="twitter-square" xmlns="http://www.w3.org/2000/svg">
                    <!-- use xlink:href="https://www.epa.gov/themes/epa_theme/images/sprite.artifact.svg#twitter-square"></use -->
                    <path fill="currentcolor" d="M400 32H48C21.5 32 0 53.5 0 80v352c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V80c0-26.5-21.5-48-48-48zm-48.9 158.8c.2 2.8.2 5.7.2 8.5 0 86.7-66 186.6-186.6 186.6-37.2 0-71.7-10.8-100.7-29.4 5.3.6 10.4.8 15.8.8 30.7 0 58.9-10.4 81.4-28-28.8-.6-53-19.5-61.3-45.5 10.1 1.5 19.2 1.5 29.6-1.2-30-6.1-52.5-32.5-52.5-64.4v-.8c8.7 4.9 18.9 7.9 29.6 8.3a65.447 65.447 0 01-29.2-54.6c0-12.2 3.2-23.4 8.9-33.1 32.3 39.8 80.8 65.8 135.2 68.6-9.3-44.5 24-80.6 64-80.6 18.9 0 35.9 7.9 47.9 20.7 14.8-2.8 29-8.3 41.6-15.8-4.9 15.2-15.2 28-28.8 36.1 13.2-1.4 26-5.1 37.8-10.2-8.9 13.1-20.1 24.7-32.9 34z"></path>
                  </svg>
                  <span class="usa-tag external-link__tag" title="Exit EPA Website">
                    <span aria-hidden="true">Exit</span>
                    <span class="u-visually-hidden"> Exit EPA Website</span>
                  </span>
                </a>
              </li>
              <li class="menu__item">
                <a class="menu__link" aria-label="EPA’s Youtube" href="https://www.youtube.com/user/USEPAgov">
                  <!-- svg class="icon icon--social" aria-hidden="true" -->
                  <svg class="icon icon--social" aria-hidden="true" viewBox="0 0 448 512" id="youtube-square" xmlns="http://www.w3.org/2000/svg">
                    <!-- use xlink:href="https://www.epa.gov/themes/epa_theme/images/sprite.artifact.svg#youtube-square"></use -->
                    <path fill="currentcolor" d="M186.8 202.1l95.2 54.1-95.2 54.1V202.1zM448 80v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48zm-42 176.3s0-59.6-7.6-88.2c-4.2-15.8-16.5-28.2-32.2-32.4C337.9 128 224 128 224 128s-113.9 0-142.2 7.7c-15.7 4.2-28 16.6-32.2 32.4-7.6 28.5-7.6 88.2-7.6 88.2s0 59.6 7.6 88.2c4.2 15.8 16.5 27.7 32.2 31.9C110.1 384 224 384 224 384s113.9 0 142.2-7.7c15.7-4.2 28-16.1 32.2-31.9 7.6-28.5 7.6-88.1 7.6-88.1z"></path>
                  </svg>
                  <span class="usa-tag external-link__tag" title="Exit EPA Website">
                    <span aria-hidden="true">Exit</span>
                    <span class="u-visually-hidden"> Exit EPA Website</span>
                  </span>
                </a>
              </li>
              <li class="menu__item">
                <a class="menu__link" aria-label="EPA’s Flickr" href="https://www.flickr.com/photos/usepagov">
                  <!-- svg class="icon icon--social" aria-hidden="true" -->
                  <svg class="icon icon--social" aria-hidden="true" viewBox="0 0 448 512" id="flickr-square" xmlns="http://www.w3.org/2000/svg">
                    <!-- use xlink:href="https://www.epa.gov/themes/epa_theme/images/sprite.artifact.svg#flickr-square"></use -->
                    <path fill="currentcolor" d="M400 32H48C21.5 32 0 53.5 0 80v352c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V80c0-26.5-21.5-48-48-48zM144.5 319c-35.1 0-63.5-28.4-63.5-63.5s28.4-63.5 63.5-63.5 63.5 28.4 63.5 63.5-28.4 63.5-63.5 63.5zm159 0c-35.1 0-63.5-28.4-63.5-63.5s28.4-63.5 63.5-63.5 63.5 28.4 63.5 63.5-28.4 63.5-63.5 63.5z"></path>
                  </svg>
                  <span class="usa-tag external-link__tag" title="Exit EPA Website">
                    <span aria-hidden="true">Exit</span>
                    <span class="u-visually-hidden"> Exit EPA Website</span>
                  </span>
                </a>
              </li>
              <li class="menu__item">
                <a class="menu__link" aria-label="EPA’s Instagram" href="https://www.instagram.com/epagov">
                  <!-- svg class="icon icon--social" aria-hidden="true" -->
                  <svg class="icon icon--social" aria-hidden="true" viewBox="0 0 448 512" id="instagram-square" xmlns="http://www.w3.org/2000/svg">
                    <!-- use xlink:href="https://www.epa.gov/themes/epa_theme/images/sprite.artifact.svg#instagram-square"></use -->
                    <path fill="currentcolor" xmlns="http://www.w3.org/2000/svg" d="M224 202.66A53.34 53.34 0 10277.36 256 53.38 53.38 0 00224 202.66zm124.71-41a54 54 0 00-30.41-30.41c-21-8.29-71-6.43-94.3-6.43s-73.25-1.93-94.31 6.43a54 54 0 00-30.41 30.41c-8.28 21-6.43 71.05-6.43 94.33s-1.85 73.27 6.47 94.34a54 54 0 0030.41 30.41c21 8.29 71 6.43 94.31 6.43s73.24 1.93 94.3-6.43a54 54 0 0030.41-30.41c8.35-21 6.43-71.05 6.43-94.33s1.92-73.26-6.43-94.33zM224 338a82 82 0 1182-82 81.9 81.9 0 01-82 82zm85.38-148.3a19.14 19.14 0 1119.13-19.14 19.1 19.1 0 01-19.09 19.18zM400 32H48A48 48 0 000 80v352a48 48 0 0048 48h352a48 48 0 0048-48V80a48 48 0 00-48-48zm-17.12 290c-1.29 25.63-7.14 48.34-25.85 67s-41.4 24.63-67 25.85c-26.41 1.49-105.59 1.49-132 0-25.63-1.29-48.26-7.15-67-25.85s-24.63-41.42-25.85-67c-1.49-26.42-1.49-105.61 0-132 1.29-25.63 7.07-48.34 25.85-67s41.47-24.56 67-25.78c26.41-1.49 105.59-1.49 132 0 25.63 1.29 48.33 7.15 67 25.85s24.63 41.42 25.85 67.05c1.49 26.32 1.49 105.44 0 131.88z"></path>
                  </svg>
                  <span class="usa-tag external-link__tag" title="Exit EPA Website">
                    <span aria-hidden="true">Exit</span>
                    <span class="u-visually-hidden"> Exit EPA Website</span>
                  </span>
                </a>
              </li>
            </ul>
            <p class="footer__last-updated">
              Last updated on March 30, 2022
            </p>
          </div>
        </div>
      </div>
    </footer>
    <a href="#" class="back-to-top" title="">
      <svg class="back-to-top__icon" role="img" aria-label="">
      <svg class="back-to-top__icon" role="img" aria-label="" viewBox="0 0 19 12" id="arrow" xmlns="http://www.w3.org/2000/svg">
        <!-- use xlink:href="https://www.epa.gov/themes/epa_theme/images/sprite.artifact.svg#arrow"></use -->
        <path fill="currentColor" d="M2.3 12l7.5-7.5 7.5 7.5 2.3-2.3L9.9 0 .2 9.7 2.5 12z"></path>
      </svg>
    </a>'
	)
) # END fluidPage

# Insert your server code here
## Begin example server code
server <- function(input, output, session){
    # increase file upload size to 30MB
    options(shiny.maxRequestSize=30*1024^2)
    # region -----

    region_class <- eventReactive(c(input$reg_button, input$map_click,input$vol_region, input$user_region),{
        if(!is.null(map_coords()) && input$vol_region == 'Select Location on Map'){
            x <- point_region(map_coords()[1], map_coords()[2])
        } else if (input$vol_region == 'Select Region' && input$user_region != 'No Region'){
            x <- input$user_region
        } else {
            x <- point_region(user_lat = input$lat, user_lon = input$lon)
        }
        x
    })

    # store adjacent regions for report
    alt_regions_str <- reactive({
      if(!is.null(map_coords()) && input$vol_region == 'Select Location on Map'){
            alt_regions <- region_checker(map_coords()[1], map_coords()[2])
            alt_regions <- alt_regions[alt_regions != 'East']
            alt_regions_str <- str_c(alt_regions, collapse=', ')
            if (length(alt_regions) > 0){
                show_alert(
                    title = "Location Warning!",
                    text = tagList(
                            tags$p(
                                    HTML(paste0("This site is located within 10 miles of another SDAM region. Please consider using one of the following SDAMs:",
                                                "<br><br>",
                                                "<b>", alt_regions_str, "</b>"
                                            )
                                        )
                                )
                            ),
                    type = "info"
                )

            }
        } else if (input$vol_region != 'Select Region' && input$vol_region != 'Select Location on Map'){
            alt_regions <- region_checker(input$lat, input$lon)
            alt_regions <- alt_regions[alt_regions != 'East']
            alt_regions_str <- str_c(alt_regions, collapse=', ')
            if (length(alt_regions) > 0){
                show_alert(
                    title = "Location Warning!",
                    text = tagList(
                            tags$p(
                                    HTML(paste0("This site is located within 10 miles of another SDAM region.  <br>Please consider using one of the following SDAMs:",
                                                "<br><br>",
                                                "<b>", alt_regions_str, "</b>"
                                            )
                                        )
                                    )
                                ),
                    type = "info"
                )

            }
        } else {
          alt_regions_str <- 'No Regions Within 10 Miles'
        }
        alt_regions_str
    })

    observeEvent(alt_regions_str(), {
        print(alt_regions_str())
    })

      # Alert user if their site is located within a 10-mile distance of another region(s)
    observeEvent(c(input$reg_button, input$map_click,input$vol_region, input$user_region),{
      if(!is.null(map_coords()) && input$vol_region == 'Select Location on Map'){
            alt_regions <- region_checker(map_coords()[1], map_coords()[2])
            alt_regions <- alt_regions[alt_regions != 'East']
            alt_regions_str <- str_c(alt_regions, collapse=', ')
            if (length(alt_regions) > 0){
                show_alert(
                    title = "Location Warning!",
                    text = tagList(
                            tags$p(
                                    HTML(paste0("This site is located within 10 miles of another SDAM region. Please consider using one of the following SDAMs:",
                                                "<br><br>",
                                                "<b>", alt_regions_str, "</b>"
                                            )
                                        )
                                )
                            ),
                    type = "info"
                )

            }
        } else if (input$vol_region != 'Select Region' && input$vol_region != 'Select Location on Map'){
            alt_regions <- region_checker(input$lat, input$lon)
            alt_regions <- alt_regions[alt_regions != 'East']
            alt_regions_str <- str_c(alt_regions, collapse=', ')
            if (length(alt_regions) > 0){
                show_alert(
                    title = "Location Warning!",
                    text = tagList(
                            tags$p(
                                    HTML(paste0("This site is located within 10 miles of another SDAM region.  <br>Please consider using one of the following SDAMs:",
                                                "<br><br>",
                                                "<b>", alt_regions_str, "</b>"
                                            )
                                        )
                                    )
                                ),
                    type = "info"
                )

            }
        } else {
          alt_regions_str <- 'No Regions Within 10 Miles'
        }

    })
    
      
    output$regionSelection <- renderText({
      region_class()$region
    })

    # Render UI Panels ------

    ### region panel-----
    output$regionPanel <- renderUI({
      if (is.atomic(region_class())){
        # print(region_class())
        print('Is AtomiC!')
        if (region_class() == 'East'){
            show_alert(
                    title = "Location Error!",
                    text = tagList(
                            tags$p(HTML(paste0("This site is located in the East Beta SDAM study area.",
                                            "Please visit the <a href=\"https://ecosystemplanningrestoration.shinyapps.io/beta_sdam_nese/\">East Beta SDAM application</a>  for the Northeast and Southeast."
                                            )
                                        )
                                    )
                                ),
                            type = "error"
            )

        } else  if (region_class() == 'Great Plains' ){
          gp_panel()
        } else  if (region_class() == 'Western Mountains' ){
          wm_panel()
        } else  if (region_class() == 'Arid West' ){
          aw_panel()
        } else  if (region_class() == 'Pacific Northwest' ){
          pnw_panel()
        }

      } else if (!is.atomic(region_class())){
        print('IS NOT ATOMIC!!!')

        if (region_class()$region == 'East'){
          show_alert(
                title = "Location Error!",
                text = tagList(
                        tags$p(HTML(paste0("This site is located in the East Beta SDAM study area.",
                                        "Please visit the <a href=\"https://ecosystemplanningrestoration.shinyapps.io/beta_sdam_nese/\">East Beta SDAM application</a>  for the Northeast and Southeast."
                                        )
                                    )
                                )
                            ),
                        type = "error"
                        )

        } else  if (region_class()$region == 'Great Plains' ){
          gp_panel()
        } else  if (region_class()$region == 'Western Mountains' ){
          wm_panel()
        } else  if (region_class()$region == 'Arid West' ){
          aw_panel()
        } else  if (region_class()$region == 'Pacific Northwest' ){
          pnw_panel()
        }
      } else return(NULL)
    })
    
    ### report panel--------
    output$reportPanel <- renderUI({
        if (is.atomic(region_class())){

          if(region_class() == 'Great Plains' & input$runmodel != 0){
            gp_report()
          } else if (region_class() == 'Western Mountains' & input$runmodel != 0){
            wm_report()
          } else if (region_class() == 'Arid West' & input$runmodel != 0){
            aw_report()
          } else if (region_class() == 'Pacific Northwest' & input$runmodel != 0){
            pnw_report()
          }

        } else if (!is.atomic(region_class())){

          if(region_class()$region == 'Great Plains' & input$runmodel != 0){
            gp_report()
          } else if (region_class()$region == 'Western Mountains' & input$runmodel != 0){
            wm_report()
          } else if (region_class()$region == 'Arid West' & input$runmodel != 0){
            aw_report()
          } else if (region_class()$region == 'Pacific Northwest' & input$runmodel != 0){
            pnw_report()
          }

        }
        
      })

    
    observe({
        print(is.atomic(region_class()))
        if (is.atomic(region_class())){
            # print(region_class())
        } else {
        print(region_class()$region)
        }
    })


    
  # If site out of SDAM study areas, return warning message from global function
  final_sdams <- list('Great Plains', 'Arid West', 'Western Mountains', 'Pacific Northwest')
  observeEvent(c(input$reg_button, region_class()),{
      
      if (is.atomic(region_class())){
          output$reg_class <- renderUI ({
              h2(HTML(paste0("<b>SDAM Region: <br>", region_class(), "</b>")))
          })
      } else if (!is.atomic(region_class())){
   
        if (is.na(region_class()$region)){
          
          show_alert(
            title = "Location Error!",
            text = tagList(
              tags$p(HTML(paste0("The location of your site is outside of the SDAM study areas.",
                                 " Please check your latitude and longitude coordinates to ensure they are entered correctly.<br>")
              )
              )
            ),
            type = "error"
          )
          
        } else {
          
            if (!(region_class()$region %in% final_sdams) && !is.na(region_class()$region)){

                if (region_class()$URL != 'development' && region_class()$URL != 'planning'){
                    show_alert(
                        title = "Location Error!",
                        text = tagList(
                            tags$p(HTML(paste0("This site is outside of the Final SDAM study areas.  The site is located in the ",
                                               '<a href=\"', region_class()$URL, '">',
                                               region_class()$region), ' SDAM.</a>')
                            )
                        ),
                        type = "error"
                    )
                } else {
                    show_alert(
                        title = "Location Error!",
                        text = tagList(
                            tags$p(HTML(paste0("This site is located outside of the Final SDAM study areas.  The site is located in the <b>",
                                               region_class()$region, "</b> SDAM region.  The ",
                                               region_class()$region, " is in the <b>",
                                               region_class()$URL, "</b> stage."))
                            )
                        ),
                        type = "error"
                    )
                }
  
            } else {
                output$reg_class <- renderUI ({
                    if(!is.na(region_class()$region)){
                        if(region_class()$region == 'Northeast' || region_class()$region == 'Southeast'){
                            h2(HTML(paste0("<b>Eastern Region: <br>", region_class()$region, "</b>")))
                        } else {
                            h2(HTML(paste0("<b>SDAM Region: <br>", region_class()$region, "</b>")))
                        }
                    }
                })
            }
        }
      }
  })

    # leaflet map render-----
    output$map <- renderLeaflet({
        factPal <- colorFactor(
          pal = rainbow(9), 
          levels = regions_leaflet$SDAM)
        leaflet(regions_leaflet) %>%
            addPolygons(stroke = TRUE,
                        weight=2,
                        fillOpacity = 0.3,
                        smoothFactor = 2,
                        color='black',
                        fillColor = ~factPal(regions_leaflet$SDAM),
                        group = "SDAM Regions") %>%
            setView(lng = -100.5,
                    lat = 35.5,
                    zoom = 5) %>%
            addLegend("bottomright",
                      title = HTML("<b><u>SDAM Regions</u></b>"),
                      pal = factPal,
                      values = regions_leaflet$SDAM,
                      group = "SDAM Regions") %>%

            addProviderTiles(providers$Esri.NatGeoWorldMap,
                             group = 'NatGeo World (Default)') %>%
            addProviderTiles(providers$Esri.WorldImagery,
                             group = 'Imagery') %>%
            addLayersControl(
                baseGroups=c("NatGeo World (Default)", "Imagery"),
                overlayGroups = "SDAM Regions",
                options = layersControlOptions(collapsed = FALSE)) %>%
            leafem::addMouseCoordinates() %>%
            addFullscreenControl()
    })
  
    # coordinates 
    map_coords <- reactive({
        click = input$map_click
        if(is.null(click))
            return()
        coords = c(round(click$lat,4), round(click$lng,4))
        updateNumericInput(
            session,
            "lat",
            value = coords[1]
        )
        updateNumericInput(
            session,
            "lon",
            value = coords[2]
        )
        coords
    })
    
    # lat/long----
    latitude <- eventReactive(c(input$map_click,input$lat, input$lon),{
        if(is.null(map_coords())){
            latitude <- input$lat
        } else if (!is.null(map_coords())){
            latitude <- map_coords()[1]
        }
        latitude
    })
    longitude <- eventReactive(c(input$map_click,input$lat, input$lon),{
        if(is.null(map_coords())){
            longitude <- input$lon
        } else if (!is.null(map_coords())){
            longitude <- map_coords()[2]
        }
        longitude
    })
    observe({
        print(latitude())
        print(longitude())
    })

    # map click----
    observe({
        click = input$map_click
        if(is.null(click))
            return()
        region <- if(!is.na(region_class()$region)){
    
          if(region_class()$region == 'Southern' || region_class()$region == 'Northern'){
              paste0(region_class()$region, ' Great Plains')
          } else {
              paste0(region_class()$region, ' SDAM Region')
          }
          
        }

        text<-HTML(paste("<b><u>", region, "</u></b><br>",
            "Latitude: ", round(click$lat, 4), ", Longtitude: ", round(click$lng, 4)))
        text2<-paste("You've selected point ", text)
        map_proxy = leafletProxy("map") %>%
            clearPopups() %>%
            addPopups(round(click$lng, 4), round(click$lat, 4), text)

        print(paste0(click$lat, ', ', click$lng))
    })




    # percent shade calculation -----
    # dynamic UI output for length 1:12 for densiometer recordings
    output$densiUI <- renderUI({
        lapply(
            X = 1:input$select,
            FUN = function(i) {
                sliderInput(inputId = paste0("densi", i), label = i, min = 0, max = 17, value = i)
            }
        )
    })
    
    # dynamic UI list of inputs for densiometer recordings
    densi_list <- eventReactive(input$select, {
        lapply(
            X = 1:input$select,
            FUN = function(i) {
                input = paste0('densi', i)
            }
        )
    })
    
    # Densiometer input names for use in report possibly
    densi_inputs <- reactive({
        list_names <- c()
        for(x in 1:length(densi_list())){
            list_names[[x]] <- paste(densi_list()[x])
        }
        return(list_names)
    })
    
    # Densiometer input values
    densi_values <- reactive({
        list_values <- c()
        for(x in 1:length(densi_list())){
            list_values[[x]] <- input[[paste(densi_list()[[x]])]]
        }
        return(list_values)
    })
    
    # calculated shade percentage
    densi_shade_perc <- eventReactive(densi_values(),{
        round((Reduce("+", densi_values()) / (input$select* 17))*100,2)
    })
    densi_shade_dec <- eventReactive(densi_values(),{
        round((Reduce("+", densi_values()) / (input$select* 17)),2)
    })
    
    # Show user calculated percent value
    output$text <- renderUI ({
        
        h3(HTML(paste0("<b>Percent Shade: ", densi_shade_perc(), "%")))
        
    })
    
    # Bankfull width calculation----
    
    # dynamic UI output for length 1:3 for bankfull width recordings
    output$bankUI <- renderUI({
        lapply(
            X = 1:input$select_bank,
            FUN = function(i) {
                numericInput(inputId = paste0("bank", i),
                             label = paste0("Bankfull Measurement ", i), 
                             value = 0)
            }
        )
    })
    
    # dynamic UI list of inputs for bankfull width recordings
    bank_list <- eventReactive(input$select_bank, {
        lapply(
            X = 1:input$select_bank,
            FUN = function(i) {
                input = paste0('bank', i)
            }
        )
    })
    
    # Densiometer input names to be possibly used in report
    bank_inputs <- reactive({
        list_names <- c()
        for(x in 1:length(bank_list())){
            list_names[[x]] <- paste(bank_list()[x])
        }
        return(list_names)
    })
    
    # Densiometer input values
    bank_values <- reactive({
        list_values <- c()
        for(x in 1:length(bank_list())){
            list_values[[x]] <- input[[paste(bank_list()[[x]])]]
        }
        return(list_values)
    })
    
    # calculated shade percentage
    bank_mean <- eventReactive(bank_values(),{
        round((Reduce("+", bank_values()) / (input$select_bank)),2)
    })
    
    # Show user calculated percent value
    output$bank_text <- renderUI ({
        h3(HTML(paste0("<b>Bankful Width (m): ", bank_mean(), "</b>")))
        
    })
    
    # used to check all of the inputs
    # AllInputs <- reactive({
    #   x <- reactiveValuesToList(input)
    #   # data.frame(
    #   #   names = names(x),
    #   #   values = unlist(x, use.names = FALSE)
    #   # )
    # })
    
    # observeEvent(AllInputs(), {
    #   print(AllInputs())
    # })
    

    # model df ----
    df <- eventReactive(input$runmodel, {

      if (is.atomic(region_class())){

        if (region_class() == 'Great Plains' ){
          gp_df(
            user_lat = input$lat,
            user_lon = input$lon,
            user_total_abundance = input$user_total_abundance,
            user_hydrophyte = input$user_hydrophyte,
            user_eph_isa = input$user_eph_isa,
            user_upland_rooted = input$user_upland_rooted,
            user_diff_veg = input$user_diff_veg,
            user_sediment_plants = input$user_sediment_plants,
            user_substrate = input$user_substrate,
            user_riff_pool = input$user_riff_pool,
            user_bank_mean = bank_mean()
          )
        } else  if (region_class() == 'Western Mountains' ){
          wm_df(
            user_lat = input$lat,
            user_lon = input$lon,
            user_total_abundance = input$user_total_abundance,
            user_hydrophyte = input$user_hydrophyte,
            user_substrate = input$user_substrate,
            user_eph_isa = input$user_eph_isa,
            user_PctShade = densi_shade_perc(),
            user_upland_rooted = input$user_upland_rooted,
            user_diff_veg = input$user_diff_veg,
            user_slope = input$user_slope,
            user_riff_pool = input$user_riff_pool,
            user_bank_mean = bank_mean()
          )
        } else  if (region_class() == 'Arid West' ){
          aw_df(
            user_lat = input$lat,
            user_lon = input$lon,
            user_hydrophyte = input$user_hydrophyte,
            user_eph_isa = input$user_eph_isa,
            user_upland_rooted = input$user_upland_rooted,
            user_diff_veg = input$user_diff_veg,
            user_algal_cover = input$user_algal_cover,
            user_slope = input$user_slope,
            user_riff_pool = input$user_riff_pool,
            user_bank_mean = bank_mean()
          )
        } else  if (region_class() == 'Pacific Northwest' ){
          pnw_df(
            user_lat = input$lat,
            user_lon = input$lon,
            user_aquatic_presence = input$user_aquatic_presence,
            user_ephemeroptera = input$user_ephemeroptera,
            user_per_taxa = input$user_per_taxa,
            user_plants = input$user_plants,
            user_slope = input$user_slope,
            user_fish = input$user_fish,
            user_amphibians = input$user_amphibians
          )
        }

      } else if (!is.atomic(region_class())){

        if (region_class()$region == 'Great Plains' ){
          gp_df(
            user_lat = input$lat,
            user_lon = input$lon,
            user_total_abundance = input$user_total_abundance,
            user_hydrophyte = input$user_hydrophyte,
            user_eph_isa = input$user_eph_isa,
            user_upland_rooted = input$user_upland_rooted,
            user_diff_veg = input$user_diff_veg,
            user_sediment_plants = input$user_sediment_plants,
            user_substrate = input$user_substrate,
            user_riff_pool = input$user_riff_pool,
            user_bank_mean = bank_mean()
          )
        } else  if (region_class()$region == 'Western Mountains' ){
          wm_df(
            user_lat = input$lat,
            user_lon = input$lon,
            user_total_abundance = input$user_total_abundance,
            user_hydrophyte = input$user_hydrophyte,
            user_substrate = input$user_substrate,
            user_eph_isa = input$user_eph_isa,
            user_PctShade = input$user_PctShade,
            user_upland_rooted = input$user_upland_rooted,
            user_diff_veg = input$user_diff_veg,
            user_slope = input$user_slope,
            user_riff_pool = input$user_riff_pool,
            user_bank_mean = bank_mean()
          )
        } else  if (region_class()$region == 'Arid West' ){
          aw_df(
            user_lat = input$lat,
            user_lon = input$lon,
            user_hydrophyte = input$user_hydrophyte,
            user_eph_isa = input$user_eph_isa,
            user_upland_rooted = input$user_upland_rooted,
            user_diff_veg = input$user_diff_veg,
            user_algal_cover = input$user_algal_cover,
            user_slope = input$user_slope,
            user_riff_pool = input$user_riff_pool,
            user_bank_mean = bank_mean()
          )
        } else  if (region_class()$region == 'Pacific Northwest' ){
          pnw_df(
            user_lat = input$lat,
            user_lon = input$lon,
            user_aquatic_presence = input$user_aquatic_presence,
            user_ephemeroptera = input$user_ephemeroptera,
            user_per_taxa = input$user_per_taxa,
            user_plants = input$user_plants,
            user_slope = input$user_slope,
            user_fish = input$user_fish,
            user_amphibians = input$user_amphibians
          )
        }
      } else return(NULL)
    })

    # observeEvent(df(), {
    #   print(df())
    # })

    
    # run rf model and output stream classification----
    classification <- eventReactive(input$runmodel, {

      if (is.atomic(region_class())){

        run_sdam(df(), region_class())

      } else if (!is.atomic(region_class())){

        run_sdam(df(), region_class()$region)
      }
      
    })

    # output classification to ui
    output$class_out <- renderUI ({
      h2(HTML(paste0("<b>", classification(), "</b>")))
    })



    
    observeEvent(input$surfflow, {
        print(input$surfflow)
        if (!is.na(input$surfflow)){
            if ((input$surfflow  < 0) | (input$surfflow  > 100) ){
                showModal(
                    modalDialog(
                        "Percent of reach with surface flow must be between 0 and 100 (inclusive)",
                        footer= modalButton("OK"),
                        easyClose = FALSE
                    )
                )
                updateNumericInput(
                    session,
                    "surfflow",
                    value = 0
                )
            }
        }
    })
    
    observeEvent(input$subflow, {
        if (!is.na(input$subflow)){
            if (input$subflow < 0 | input$subflow > 100){
                showModal(
                    modalDialog(
                        "Percent of reach with surface and subsurface flow must be between 0 and 100 (inclusive)",
                        footer= modalButton("OK"),
                        easyclose = FALSE
                    )
                )
                updateNumericInput(
                    session,
                    "subflow",
                    value = 0
                )
            }
        }
    })
    
    observeEvent(input$subflow, {
        if(!is.na(input$subflow)){
            if (input$subflow < input$surfflow ){
                showModal(
                    modalDialog(
                        "Percent of reach with surface and subsurface flow must be greater than or equal to % of reach with surface flow",
                        footer= modalButton("OK"),
                        easyclose = FALSE
                    )
                )
                updateNumericInput(
                    session,
                    "subflow",
                    value = 0
                )
            }
        }
    })
    
    observeEvent(input$pool, {
        if (!is.na(input$surfflow)){
            if (input$surfflow == 100){
                if ((input$pool != 0) | (!is.null(input$pool))  ) {
                    showModal(
                        modalDialog(
                            "Number of isolated pools must be zero or blank if % of reach with surface flow is 100",
                            footer= modalButton("OK"),
                            easyclose = FALSE
                        )
                    )
                    updateNumericInput(
                        session,
                        "pool",
                        value = 0
                    )
                }
            }
        }
    })
    
  
    # Report Tab--------------------------------------------------------------
    # 
    # eventReactive(input$report,{
    #   if (region_class()$region == 'Northeast'){
    #     print('Northeast Report') 
    #   } else if (region_class()$region == 'Southeast'){
    #     print('Southeast Report')
    #   }
    # })


      # Site photos----
      fig1 <- reactive({gsub("\\\\", "/", input$blu$datapath)})
      fig2 <- reactive({gsub("\\\\", "/", input$mld$datapath)})
      fig3 <- reactive({gsub("\\\\", "/", input$mlu$datapath)})
      fig4 <- reactive({gsub("\\\\", "/", input$tld$datapath)})
      fig5 <- reactive({gsub("\\\\", "/", input$sketch$datapath)})

      #Invertebrate photos
      fig6 <- reactive({gsub("\\\\", "/", input$inv1$datapath)})
      fig7 <- reactive({gsub("\\\\", "/", input$inv2$datapath)})
      fig8 <- reactive({gsub("\\\\", "/", input$inv3$datapath)})
      # retroactively added photos; naming convention broken
      fig6_1 <- reactive({gsub("\\\\", "/", input$inv4$datapath)})
      fig7_1 <- reactive({gsub("\\\\", "/", input$inv5$datapath)})
      fig8_1 <- reactive({gsub("\\\\", "/", input$inv6$datapath)})

      # Substrate photos
      fig12 <- reactive({gsub("\\\\", "/", input$sub1$datapath)})
      fig13 <- reactive({gsub("\\\\", "/", input$sub2$datapath)})
      fig14 <- reactive({gsub("\\\\", "/", input$sub3$datapath)})

      # Differences in vegetation photos
      fig15 <- reactive({gsub("\\\\", "/", input$veg1$datapath)})
      fig16 <- reactive({gsub("\\\\", "/", input$veg2$datapath)})
      fig17 <- reactive({gsub("\\\\", "/", input$veg3$datapath)})

      # Sediment on Plants photos
      fig18 <- reactive({gsub("\\\\", "/", input$sed1$datapath)})
      fig19 <- reactive({gsub("\\\\", "/", input$sed2$datapath)})
      fig20 <- reactive({gsub("\\\\", "/", input$sed3$datapath)})

      # Slope photos
      fig21 <- reactive({gsub("\\\\", "/", input$slope1$datapath)})
      fig22 <- reactive({gsub("\\\\", "/", input$slope2$datapath)})
      fig23 <- reactive({gsub("\\\\", "/", input$slope3$datapath)})

      # Hydrophyte photos
      fig24 <- reactive({gsub("\\\\", "/", input$hydro1$datapath)})
      fig25 <- reactive({gsub("\\\\", "/", input$hydro2$datapath)})
      fig26 <- reactive({gsub("\\\\", "/", input$hydro3$datapath)})
      fig27 <- reactive({gsub("\\\\", "/", input$hydro4$datapath)})
      fig28 <- reactive({gsub("\\\\", "/", input$hydro5$datapath)})
      fig29 <- reactive({gsub("\\\\", "/", input$hydro6$datapath)})
      
      # Fish photos
      fig30 <- reactive({gsub("\\\\", "/", input$fish1$datapath)})
      fig31 <- reactive({gsub("\\\\", "/", input$fish2$datapath)})
      fig32 <- reactive({gsub("\\\\", "/", input$fish3$datapath)})

      # Perennial Indicator photos
      fig33 <- reactive({gsub("\\\\", "/", input$per1$datapath)})
      fig34 <- reactive({gsub("\\\\", "/", input$per2$datapath)})
      fig35 <- reactive({gsub("\\\\", "/", input$per3$datapath)})

      # Algal Cover photos
      fig36 <- reactive({gsub("\\\\", "/", input$algal1$datapath)})
      fig37 <- reactive({gsub("\\\\", "/", input$algal2$datapath)})
      fig38 <- reactive({gsub("\\\\", "/", input$algal3$datapath)})

      # Amphibian photos
      fig39 <- reactive({gsub("\\\\", "/", input$amph1$datapath)})
      fig40 <- reactive({gsub("\\\\", "/", input$amph2$datapath)})
      fig41 <- reactive({gsub("\\\\", "/", input$amph3$datapath)})

      # Riffle Pool photos
      fig42 <- reactive({gsub("\\\\", "/", input$riff1$datapath)})
      fig43 <- reactive({gsub("\\\\", "/", input$riff2$datapath)})
      fig44 <- reactive({gsub("\\\\", "/", input$riff3$datapath)})

      # Upland rooted photos
      fig45 <- reactive({gsub("\\\\", "/", input$ur1$datapath)})
      fig46 <- reactive({gsub("\\\\", "/", input$ur2$datapath)})
      fig47 <- reactive({gsub("\\\\", "/", input$ur3$datapath)})

      # Supplemental Info photos
      fig48 <- reactive({gsub("\\\\", "/", input$add1$datapath)})
      fig49 <- reactive({gsub("\\\\", "/", input$add2$datapath)})
      fig50 <- reactive({gsub("\\\\", "/", input$add3$datapath)})
      fig51 <- reactive({gsub("\\\\", "/", input$add4$datapath)})


    output$report <- downloadHandler(
        filename = glue::glue("SDAM Report ({format(Sys.time(), '%B %d, %Y')}).pdf"),
        content = function(file) {

            temp_region <- if (is.atomic(region_class())){
              region_class()
            } else {
              region_class()$region 
            }       

            temp_lat <- if (input$vol_region == 'Select Region'){
              'Not Provided'
            } else {
              as.numeric(input$lat)
            }

            temp_lon <- if (input$vol_region == 'Select Region'){
              'Not Provided'
            } else {
              as.numeric(input$lon)
            }

            general_params <- list(
              # -------------------Classification
              stream_class = classification(),
              region = temp_region,

              # precip = precip(),
              drain_area = input$user_DRNAREA,



              # -------------------General Site Information
              a = input$project,
              b = input$assessor,
              c = input$code,
              d = input$waterway,
              e = input$date,
              adj_regions = alt_regions_str(),
              bm = case_when(input$radio_weather == 'heavyrain' ~ "Storm/heavy rain",
                              input$radio_weather == 'steadyrain' ~ "Steady rain",
                              input$radio_weather == 'intermittentrain' ~ "Intermittent rain",
                              input$radio_weather == 'snowing' ~ "Snowing",
                              input$radio_weather == 'cloudy' ~ "Cloudy",
                              input$radio_weather == 'clearsunny' ~ "Clear/Sunny"),


              j = input$weather,
              g = temp_lat,
              h = temp_lon,
              l = plyr::mapvalues(
                  input$check_use,
                  from = c(
                  "urban","agricultural", "Developed open-space (e.g., golf course, parks, lawn grasses)",
                  "forested","othernatural","other"),
                  to = c(
                  "Urban, industrial, or residential", "Agricultural","Developed open-space",
                  "Forested","Other Natural","Other")
              ) %>% as.character() %>% paste0(collapse = ", "),
              f = input$boundary,
              fff = input$actreach,
              bn = plyr::mapvalues(
                  input$radio_situation,
                  from = c(
                  "flood","stream_modifications", "diversions",
                  "Water discharges","drought","vegetation",
                  "other","none"),
                  to = c(
                  "Recent flood or debris flow","Stream modifications (e.g., channelization)","Diversions",
                  "Water discharges","Drought","Vegetation removal/limitations",
                  "Other (explain in notes)","None")
              ) %>% as.character() %>% paste0(collapse = ", "),
              k = input$situation,

              # ------------------- Site Photos
              v = fig4(),
              u = fig3(),
              t = fig2(),
              s = fig1(),

              # ------------------- Observed Hydrology
              m = input$surfflow,
              n = input$subflow,
              o = input$pool,
              r = input$notes_observed_hydrology,

              # ------------------- Site Sketch
              w = fig5(),

              # ------------------- Supplemental Information
              notes_supplemental_information = input$notes_supplemental_information,
              f48 = fig48(),
              f48_cap = input$add1_cap,
              f49 = fig49(),
              f49_cap = input$add2_cap,
              f50 = fig50(),
              f50_cap = input$add3_cap,
              f51 = fig51(),
              f51_cap = input$add4_cap
            )   

            if (temp_region == 'Arid West'){
                ## Arid West----
                
                        
                        ### Report----
                        tryCatch({
            
                            showModal(modalDialog("Please wait while the report is being generated.....", footer=NULL))
                            tempReport <- file.path("markdown/aw_report.Rmd")
                            file.copy("aw_report.Rmd", tempReport, overwrite = TRUE)
            
                            # Set up parameters to pass to Rmd document
                            region_params <- list(
                                
                                ### ------------------- Biological indicators
                                # EPT Taxa
                                aqua_inv = input$user_total_abundance,
                                f6 = fig6(),
                                f6_cap = input$inv1_cap,
                                f7 = fig7(),
                                f7_cap = input$inv2_cap,
                                f8 = fig8(),
                                f8_cap = input$inv3_cap,
                                f6_1 = fig6_1(),
                                f6_1cap = input$inv4_cap,
                                f7_1 = fig7_1(),
                                f7_1cap = input$inv5_cap,
                                f8_1 = fig8_1(),
                                f8_cap = input$inv6_cap,
                                notes_aquainv = input$notes_totalAbundance,

                                # Hydrophytes
                                hydro = input$user_hydrophyte,
                                f24 = fig24(),
                                f24_cap = input$hydro1_cap,
                                f25 = fig25(),
                                f25_cap = input$hydro2_cap,
                                f26 = fig26(),
                                f26_cap = input$hydro3_cap,
                                f27 = fig27(),
                                f27_cap = input$hydro4_cap,
                                f28 = fig28(),
                                f28_cap = input$hydro5_cap,
                                f29 = fig29(),
                                f29_cap = input$hydro6_cap,
                                notes_hydro = input$notes_hydro,                       

                                # Upland Rooted
                                upland_rooted = input$user_upland_rooted,
                                f45 = fig45(),
                                f45_cap = input$ur1_cap,
                                f46 = fig46(),
                                f46_cap = input$ur2_cap,
                                f47 = fig47(),
                                f47_cap = input$ur3_cap,
                                notes_rooted = input$notes_rooted,
                                
                                # Agal Cover
                                algal = input$user_algal_cover,
                                f36 = fig36(),
                                f36_cap = input$algal1_cap,
                                f37 = fig37(),
                                f37_cap = input$algal2_cap,
                                f38 = fig38(),
                                f38_cap = input$algal3_cap,
                                notes_algal = input$notes_algal,

                                # Difference in Veg
                                vegetation = input$user_diff_veg,
                                f15 = fig15(),
                                f15_cap = input$veg1_cap,
                                f16 = fig16(),
                                f16_cap = input$veg2_cap,
                                f17 = fig17(),
                                f17_cap = input$veg3_cap,
                                notes_vegetation = input$notes_veg,

                                # Slope
                                slope = input$user_slope,
                                f21 = fig21(),
                                f21_cap = input$slope1_cap,
                                f22 = fig22(),
                                f22_cap = input$slope2_cap,
                                f23 = fig23(),
                                f23_cap = input$slope3_cap,
                                notes_slope = input$notes_slope,

                                # Riffle Pool Sequence
                                riff = input$user_riff_pool,
                                f42 = fig42(),
                                f42_cap = input$riff1_cap,
                                f43 = fig43(),
                                f43_cap = input$riff2_cap,
                                f44 = fig44(),
                                f44_cap = input$riff3_cap,
                                notes_riff = input$notes_riff,
                
                                # Bank Width
                                bankwidth = bank_mean()


                            )

                            params <- c(general_params, region_params)
            
                            # Knit the document, passing in the `params` list, and eval it in a
                            # child of the global environment (this isolates the code in the document
                            # from the code in this app).
                            rmarkdown::render(
                                tempReport,
                                output_file = file,
                                params = params,
                                envir = new.env(parent = globalenv())
                            )
                            removeModal()
                        },
                        warning = function(cond){
                            showModal(
                            modalDialog(
                                "There was an error while generating the report.
                            Please contact Will Saulnier (wsaulnier@eprusa.net) for more details.",
                                footer = modalButton("Ok")
                            )
                            )
                            return(NULL)
                        })

            } else if (temp_region == 'East'){
                # reserved for future final East SDAM

            } else if (temp_region == 'Great Plains'){
                ## Great Plains ----

                        tryCatch({
            
                            showModal(modalDialog("Please wait while the report is being generated.....", footer=NULL))
                            tempReport <- file.path("markdown/gp_report.Rmd")
                            file.copy("gp_report.Rmd", tempReport, overwrite = TRUE)
            
                            # Set up parameters to pass to Rmd document
                            region_params <- list(
                                
                                # ------------------- Biological indicators
                                # EPT Taxa
                                aqua_inv = input$user_total_abundance,
                                f6 = fig6(),
                                f6_cap = input$inv1_cap,
                                f7 = fig7(),
                                f7_cap = input$inv2_cap,
                                f8 = fig8(),
                                f8_cap = input$inv3_cap,
                                f6_1 = fig6_1(),
                                f6_1cap = input$inv4_cap,
                                f7_1 = fig7_1(),
                                f7_1cap = input$inv5_cap,
                                f8_1 = fig8_1(),
                                f8_cap = input$inv6_cap,
                                notes_aquainv = input$notes_totalAbundance,

                                # Hydrophytes
                                hydro = input$user_hydrophyte,
                                f24 = fig24(),
                                f24_cap = input$hydro1_cap,
                                f25 = fig25(),
                                f25_cap = input$hydro2_cap,
                                f26 = fig26(),
                                f26_cap = input$hydro3_cap,
                                f27 = fig27(),
                                f27_cap = input$hydro4_cap,
                                f28 = fig28(),
                                f28_cap = input$hydro5_cap,
                                f29 = fig29(),
                                f29_cap = input$hydro6_cap,
                                notes_hydro = input$notes_hydro,                       

                                # Upland Rooted
                                upland_rooted = input$user_upland_rooted,
                                f45 = fig45(),
                                f45_cap = input$ur1_cap,
                                f46 = fig46(),
                                f46_cap = input$ur2_cap,
                                f47 = fig47(),
                                f47_cap = input$ur3_cap,
                                notes_rooted = input$notes_rooted,

                                # Substrate
                                substrate = input$user_substrate,
                                f12 = fig12(),
                                f12_cap = input$sub1_cap,
                                f13 = fig13(),
                                f13_cap = input$sub2_cap,
                                f14 = fig14(),
                                f14_cap = input$sub3_cap,
                                notes_sub = input$notes_sub,

                                # Difference in Veg
                                vegetation = input$user_diff_veg,
                                f15 = fig15(),
                                f15_cap = input$veg1_cap,
                                f16 = fig16(),
                                f16_cap = input$veg2_cap,
                                f17 = fig17(),
                                f17_cap = input$veg3_cap,
                                notes_vegetation = input$notes_veg,

                                # Sediment on plants
                                sediment = input$user_sediment_plants,
                                f18 = fig18(),
                                f18_cap = input$sed1_cap,
                                f19 = fig19(),
                                f19_cap = input$sed2_cap,
                                f20 = fig20(),
                                f20_cap = input$sed3_cap,
                                notes_sed = input$notes_sed,

                                # Riffle Pool Sequence
                                riff = input$user_riff_pool,
                                f42 = fig42(),
                                f42_cap = input$riff1_cap,
                                f43 = fig43(),
                                f43_cap = input$riff2_cap,
                                f44 = fig44(),
                                f44_cap = input$riff3_cap,
                                notes_riff = input$notes_riff,
                
                                # Bank Width
                                bankwidth = bank_mean()


                            )

                            params <- c(general_params, region_params)
            
                            # Knit the document, passing in the `params` list, and eval it in a
                            # child of the global environment (this isolates the code in the document
                            # from the code in this app).
                            rmarkdown::render(
                            tempReport,
                            output_file = file,
                            params = params,
                            envir = new.env(parent = globalenv())
                            )
                            removeModal()
                        },
                        warning = function(cond){
                            showModal(
                            modalDialog(
                                "There was an error while generating the report.
                            Please contact Will Saulnier (wsaulnier@eprusa.net) for more details.",
                                footer = modalButton("Ok")
                            )
                            )
                            return(NULL)
                        })


            } else if (temp_region == 'Pacific Northwest'){
                ## Pacific Northwest----
                        tryCatch({
            
                            showModal(modalDialog("Please wait while the report is being generated.....", footer=NULL))
                            tempReport <- file.path("markdown/pnw_report.Rmd")
                            file.copy("pnw_report.Rmd", tempReport, overwrite = TRUE)
            
                            # Set up parameters to pass to Rmd document
                            region_params <- list(
                                
                                # ------------------- Biological indicators
                                # EPT Taxa
                                aqua_inv = input$user_total_abundance,
                                ephem = input$user_ephemeroptera,
                                f6 = fig6(),
                                f6_cap = input$inv1_cap,
                                f7 = fig7(),
                                f7_cap = input$inv2_cap,
                                f8 = fig8(),
                                f8_cap = input$inv3_cap,
                                f6_1 = fig6_1(),
                                f6_1cap = input$inv4_cap,
                                f7_1 = fig7_1(),
                                f7_1cap = input$inv5_cap,
                                f8_1 = fig8_1(),
                                f8_cap = input$inv6_cap,
                                notes_aquainv = input$notes_totalAbundance,

                                # Hydrophytes
                                hydro = input$user_plants,
                                f24 = fig24(),
                                f24_cap = input$hydro1_cap,
                                f25 = fig25(),
                                f25_cap = input$hydro2_cap,
                                f26 = fig26(),
                                f26_cap = input$hydro3_cap,
                                f27 = fig27(),
                                f27_cap = input$hydro4_cap,
                                f28 = fig28(),
                                f28_cap = input$hydro5_cap,
                                f29 = fig29(),
                                f29_cap = input$hydro6_cap,
                                notes_hydro = input$notes_hydro,                       

                                # Perennial Taxa
                                per_taxa = input$user_per_taxa,
                                f33 = fig33(),
                                f33_cap = input$per1_cap,
                                f34 = fig34(),
                                f34_cap = input$per2_cap,
                                f35 = fig35(),
                                f35_cap = input$per3_cap,
                                notes_per = input$notes_per,

                                # Fish
                                fish = input$user_fish,
                                f30 = fig30(),
                                f30_cap = input$fish1_cap,
                                f31 = fig31(),
                                f31_cap = input$fish2_cap,
                                f32 = fig32(),
                                f32_cap = input$fish3_cap,
                                notes_fish = input$notes_fish,

                                # Amphibians
                                amphibians = input$user_amphibians,
                                f39 = fig39(),
                                f39_cap = input$amph1_cap,
                                f40 = fig40(),
                                f40_cap = input$amph2_cap,
                                f41 = fig41(),
                                f41_cap = input$amph3_cap,
                                notes_amph = input$notes_amph,

                                # Slope
                                slope = input$user_slope,
                                f21 = fig21(),
                                f21_cap = input$slope1_cap,
                                f22 = fig22(),
                                f22_cap = input$slope2_cap,
                                f23 = fig23(),
                                f23_cap = input$slope3_cap,
                                notes_slope = input$notes_slope


                            )

                            params <- c(general_params, region_params)
            
                            # Knit the document, passing in the `params` list, and eval it in a
                            # child of the global environment (this isolates the code in the document
                            # from the code in this app).
                            rmarkdown::render(
                            tempReport,
                            output_file = file,
                            params = params,
                            envir = new.env(parent = globalenv())
                            )
                            removeModal()
                        },
                        warning = function(cond){
                            showModal(
                            modalDialog(
                                "There was an error while generating the report.
                            Please contact Will Saulnier (wsaulnier@eprusa.net) for more details.",
                                footer = modalButton("Ok")
                            )
                            )
                            return(NULL)
                        })
            

            } else if (temp_region == 'Western Mountains'){
                ## Western Mountains----

                        tryCatch({
            
                            showModal(modalDialog("Please wait while the report is being generated.....", footer=NULL))
                            tempReport <- file.path("markdown/wm_report.Rmd")
                            file.copy("wm_report.Rmd", tempReport, overwrite = TRUE)
            
                            # Set up parameters to pass to Rmd document
                            region_params <- list(
                                
                                # ------------------- Biological indicators
                                # EPT Taxa
                                aqua_inv = input$user_total_abundance,
                                f6 = fig6(),
                                f6_cap = input$inv1_cap,
                                f7 = fig7(),
                                f7_cap = input$inv2_cap,
                                f8 = fig8(),
                                f8_cap = input$inv3_cap,
                                f6_1 = fig6_1(),
                                f6_1cap = input$inv4_cap,
                                f7_1 = fig7_1(),
                                f7_1cap = input$inv5_cap,
                                f8_1 = fig8_1(),
                                f8_cap = input$inv6_cap,
                                notes_aquainv = input$notes_totalAbundance,

                                # Hydrophytes
                                hydro = input$user_hydrophyte,
                                f24 = fig24(),
                                f24_cap = input$hydro1_cap,
                                f25 = fig25(),
                                f25_cap = input$hydro2_cap,
                                f26 = fig26(),
                                f26_cap = input$hydro3_cap,
                                f27 = fig27(),
                                f27_cap = input$hydro4_cap,
                                f28 = fig28(),
                                f28_cap = input$hydro5_cap,
                                f29 = fig29(),
                                f29_cap = input$hydro6_cap,
                                notes_hydro = input$notes_hydro,                       

                                # Upland Rooted
                                upland_rooted = input$user_upland_rooted,
                                f45 = fig45(),
                                f45_cap = input$ur1_cap,
                                f46 = fig46(),
                                f46_cap = input$ur2_cap,
                                f47 = fig47(),
                                f47_cap = input$ur3_cap,
                                notes_rooted = input$notes_rooted,

                                # Substrate
                                substrate = input$user_substrate,
                                f12 = fig12(),
                                f12_cap = input$sub1_cap,
                                f13 = fig13(),
                                f13_cap = input$sub2_cap,
                                f14 = fig14(),
                                f14_cap = input$sub3_cap,
                                notes_sub = input$notes_sub,

                                # Difference in Veg
                                vegetation = input$user_diff_veg,
                                f15 = fig15(),
                                f15_cap = input$veg1_cap,
                                f16 = fig16(),
                                f16_cap = input$veg2_cap,
                                f17 = fig17(),
                                f17_cap = input$veg3_cap,
                                notes_vegetation = input$notes_veg,

                                # Slope
                                slope = input$user_slope,
                                f21 = fig21(),
                                f21_cap = input$slope1_cap,
                                f22 = fig22(),
                                f22_cap = input$slope2_cap,
                                f23 = fig23(),
                                f23_cap = input$slope3_cap,
                                notes_slope = input$notes_slope,

                                # Riffle Pool Sequence
                                riff = input$user_riff_pool,
                                f42 = fig42(),
                                f42_cap = input$riff1_cap,
                                f43 = fig43(),
                                f43_cap = input$riff2_cap,
                                f44 = fig44(),
                                f44_cap = input$riff3_cap,
                                notes_riff = input$notes_riff,
                
                                # Bank Width
                                bankwidth = bank_mean(),
                
                                # Percent Shade
                                shade = densi_shade_perc()


                            )

                            params <- c(general_params, region_params)
            
                            # Knit the document, passing in the `params` list, and eval it in a
                            # child of the global environment (this isolates the code in the document
                            # from the code in this app).
                            rmarkdown::render(
                                tempReport,
                                output_file = file,
                                params = params,
                                envir = new.env(parent = globalenv())
                            )
                            removeModal()
                        },
                        warning = function(cond){
                            showModal(
                            modalDialog(
                                "There was an error while generating the report.
                            Please contact Will Saulnier (wsaulnier@eprusa.net) for more details.",
                                footer = modalButton("Ok")
                            )
                            )
                            return(NULL)
                        })
            }

        }

    )
}
## End example server code

shinyApp(ui = ui, server = server)