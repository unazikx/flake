{
  writeTextFile,
  lib,
}:

writeTextFile {
  name = "little-fox";

  text =
    # css
    ''
      :root {
      	--show-reload: none;

      	--navbar-width: max(35vw, 500px);
      	--navbar-max-width: max(60vw, 800px);

      	--active-tab-width: clamp(100px, 18vw, 240px);
      	--inactive-tab-width: clamp(100px, 18vw, 180px);

      	--findbar-width: calc(
      		var(--findbar-min-width-expanded) +
      			(100vw - 2 * var(--findbar-right) - var(--findbar-min-width-expanded)) *
      			0.12
      	);

      	--findbar-top: 12px;
      	--findbar-right: max(2vw, 30px);

      	--findbar-transition-duration: 100ms;

      	--findbar-transition-distance: 20px;

      	--show-highlight-all: 1;
      	--show-match-case: 1;
      	--show-match-diacritics: 1;
      	--show-whole-words: 1;

      	--highlight-all-position: 0;
      	--match-case-position: 1;
      	--match-diacritics-position: 2;
      	--whole-words-position: 3;
      }

      @media (min-width: 1200px) {
      	#navigator-toolbox {
      		display: flex !important;
      		flex-wrap: wrap !important;
      		flex-direction: row !important;
      	}

      	#toolbar-menubar {
      		order: 0;
      		width: 100% !important;
      	}

      	#nav-bar {
      		order: 1;
      		width: var(--navbar-width) !important;
      	}
      	#nav-bar:has(#urlbar[open]) {
      		width: var(--navbar-max-width) !important;
      	}

      	#TabsToolbar {
      		order: 2;
      		width: auto !important;
      	}
      	#navigator-toolbox:has(#urlbar[open]) #TabsToolbar {
      		margin-left: calc(var(--navbar-width) - var(--navbar-max-width)) !important;
      	}

      	#PersonalToolbar {
      		order: 3;
      		width: 100% !important;
      	}
      }

      :root {
      	--arrowpanel-border-color: transparent !important;

      	--toolbar-field-focus-border-color: transparent !important;
      }

      #navigator-toolbox {
      	border: none !important;
      }

      .menupopup-arrowscrollbox {
      	border: none !important;
      }

      #notifications-toolbar {
      	display: none !important;
      }

      .titlebar-spacer {
      	display: none !important;
      }

      #nav-bar {
      	background: none !important;
      }

      .urlbar-input-container {
      	background: var(--toolbar-bgcolor) !important;
      }

      #PanelUI-button {
      	order: -2 !important;
      }
      #PanelUI-menu-button {
      	padding-inline-start: var(--toolbar-start-end-padding) !important;
      	padding-inline-end: var(--toolbarbutton-outer-padding) !important;
      }

      #unified-extensions-button {
      	order: -1 !important;
      	width: 0px !important;
      	padding: 0px !important;
      	box-sizing: content-box !important;
      	justify-content: flex-start !important;
      	overflow: hidden !important;
      	transition:
      		width 80ms ease-out,
      		padding 80ms ease-out !important;
      }

      #nav-bar:has(#PanelUI-menu-button:not([open]):hover) #unified-extensions-button,
      #unified-extensions-button:is(
      	:hover,
      	[open],
      	:has(.toolbarbutton-icon[showing])
      ) {
      	width: calc(2 * var(--toolbarbutton-inner-padding) + 16px) !important;
      	padding: 0px var(--toolbarbutton-outer-padding) !important;
      	transition-delay: 450ms !important;
      }

      #forward-button,
      #back-button {
      	display: none;
      }

      #stop-reload-button {
      	display: var(--show-reload) !important;
      }

      .toolbaritem-combined-buttons {
      	margin-inline: 0px !important;
      }

      #nav-bar-customization-target
      	> :first-child:not([disabled], #unified-extensions-button) {
      	&:is(toolbarbutton) {
      		padding-inline-start: var(--toolbarbutton-outer-padding) !important;
      	}
      	&:is(toolbaritem) {
      		padding-inline-start: 0px !important;
      	}
      }
      #nav-bar-customization-target
      	> :is(toolbaritem):not([disabled], #unified-extensions-button):first-child {
      	padding-inline-start: 0px !important;
      }

      @media (min-width: 1200px) {
      	hbox#nav-bar-customization-target
      		> :nth-last-child(
      			1
      				of
      				:is(toolbarbutton, toolbaritem):not(
      					[disabled],
      					#unified-extensions-button
      				)
      		) {
      		&:is(#stop-reload-button, .unified-extensions-item) {
      			padding-inline-end: calc(
      				var(--urlbar-margin-inline) - var(--toolbarbutton-outer-padding)
      			) !important;
      		}
      		&:not(#urlbar-container, #stop-reload-button, .unified-extensions-item) {
      			padding-inline-end: var(--urlbar-margin-inline) !important;
      		}
      	}
      }

      @media (max-width: 1200px) {
      	hbox#nav-bar-customization-target
      		> :nth-last-child(
      			1
      				of
      				:is(toolbarbutton, toolbaritem):not(
      					[disabled],
      					#unified-extensions-button
      				)
      		) {
      		&:is(#urlbar-container) {
      			margin-inline-end: var(--toolbar-start-end-padding) !important;
      		}
      		&:is(#stop-reload-button, .unified-extensions-item) {
      			padding-inline-end: calc(
      				var(--toolbar-start-end-padding) - var(--toolbarbutton-outer-padding)
      			) !important;
      		}
      		&:not(#urlbar-container, #stop-reload-button, .unified-extensions-item) {
      			padding-inline-end: var(--toolbar-start-end-padding) !important;
      		}
      	}
      }

      #urlbar-container {
      	width: auto !important;
      }

      #urlbar:not(:hover, [focused]) .urlbar-background {
      	background: none !important;
      }

      #urlbar:not([focused]) .urlbar-input-box {
      	padding-left: var(--urlbar-icon-padding) !important;
      }

      #urlbar:not([focused]):not(
      		:has(
      			:is(#tracking-protection-icon-container, #identity-box > *):is(
      				:hover,
      				[open]
      			)
      		)
      	)
      	:is(#tracking-protection-icon-container, #identity-box) {
      	display: none !important;
      }

      #urlbar:not(:hover, [focused])
      	#page-action-buttons
      	> :not([open], #urlbar-zoom-button) {
      	display: none !important;
      }

      #tabbrowser-tabs {
      	order: -1 !important;
      }

      #tabbrowser-tabs {
      	border-inline-start: none !important;
      	padding-inline-start: 0px !important;
      	margin-inline-start: 0px !important;
      }

      @media (max-width: 1200px) {
      	#pinned-tabs-container,
      	#tabbrowser-tabs:not(
      			[overflow],
      			:has(#pinned-tabs-container > .tabbrowser-tab)
      		)
      		#tabbrowser-arrowscrollbox {
      		& > tab-group:first-child > .tab-group-label-container {
      			padding-inline-start: calc(
      				2 * var(--tab-overflow-clip-margin)
      			) !important;
      		}
      	}
      }

      #tabbrowser-tabs:not(:has(+ #new-tab-button)),
      #TabsToolbar-customization-target:has(#tabbrowser-tabs + #new-tab-button)
      	:is(#new-tab-button, #tabs-newtab-button) {
      	margin-right: 40px !important;
      }

      #pinned-tabs-container {
      	margin-inline-end: 0px !important;
      }

      .tab-group-label {
      	outline: none !important;
      }

      .tabbrowser-tab .tab-background {
      	box-shadow: none !important;
      	outline: none !important;
      }

      .tabbrowser-tab:not([pinned]) .tab-close-button {
      	display: none !important;
      }
      .tabbrowser-tab:not([pinned]):hover .tab-close-button {
      	display: inline-block !important;
      }

      .tabbrowser-tab[selected]:not([pinned]) {
      	max-width: var(--active-tab-width) !important;
      }
      :not([collapsed]) > .tabbrowser-tab[fadein]:not([selected], [pinned]) {
      	max-width: var(--inactive-tab-width) !important;
      }

      #PersonalToolbar {
      	border-top-left-radius: var(--tab-border-radius) !important;
      	border-top-right-radius: var(--tab-border-radius) !important;
      }

      #PersonalToolbar toolbarbutton {
      	margin-top: 4px !important;
      	margin-bottom: 4px !important;
      }

      #PlacesToolbarItems toolbarbutton {
      	padding: var(--bookmark-block-padding) !important;
      }

      #PlacesChevron .toolbarbutton-icon {
      	width: calc(2 * var(--bookmark-block-padding) + 16px) !important;
      	height: calc(2 * var(--bookmark-block-padding) + 16px) !important;
      	padding: var(--bookmark-block-padding) !important;
      }

      :root {
      	--show-margin: round(
      		up,
      		calc(
      			(
      					var(--show-highlight-all) + var(--show-match-case) +
      						var(--show-match-diacritics) + var(--show-whole-words)
      				) /
      				4
      		)
      	);
      	--options-width: calc(
      		34px * var(--show-highlight-all) + 34px * var(--show-match-case) + 34px *
      			var(--show-match-diacritics) + 34px * var(--show-whole-words) + 4px *
      			var(--show-margin)
      	);

      	--findbar-min-width: calc(450px - 2 * var(--findbar-right));
      	--findbar-min-width-expanded: calc(
      		var(--findbar-min-width) + var(--options-width)
      	);
      	--findbar-max-width: calc(100vw - 2 * var(--findbar-right));
      	--findbar-width-use: clamp(
      		var(--findbar-min-width-expanded),
      		var(--findbar-width),
      		var(--findbar-max-width)
      	);

      	--textbox-min-width: calc(var(--findbar-min-width) - 116px);
      	--textbox-width: calc(
      		var(--findbar-width-use) - 116px - var(--options-width)
      	);
      }

      findbar {
      	position: absolute !important;
      	top: var(--findbar-top) !important;
      	left: var(--findbar-right) !important;
      	right: var(--findbar-right) !important;
      	width: var(--findbar-width-use) !important;
      	max-width: var(--findbar-max-width) !important;
      	margin-left: auto !important;
      	border: none !important;
      	border-radius: var(--tab-border-radius) !important;
      	box-shadow: 0px 0px 3px rgba(0, 0, 0, 0.2) !important;
      }

      findbar {
      	height: 40px !important;
      	overflow: hidden !important;
      	transition-property: top, height, padding-block, visibility !important;
      	transition-duration:
      		var(--findbar-transition-duration), var(--findbar-transition-duration),
      		var(--findbar-transition-duration), 0s !important;
      	transition-timing-function:
      		ease-in-out, ease-in-out, ease-in-out, linear !important;
      	transition-delay: 0s, 0s, 0s, 0s !important;
      }
      findbar[hidden] {
      	top: calc(var(--findbar-top) - var(--findbar-transition-distance)) !important;
      	height: 0px !important;
      	padding-block: 0px !important;
      	transition-delay: 0s, 0s, 0s, var(--findbar-transition-duration) !important;
      }
      findbar > * {
      	transition-duration: calc(var(--findbar-transition-duration) / 2) !important;
      	transition-delay: calc(var(--findbar-transition-duration) / 2) !important;
      }
      findbar[hidden] > * {
      	transition-delay: 0s !important;
      }

      .findbar-textbox {
      	width: var(--textbox-width) !important;
      	min-width: var(--textbox-min-width) !important;
      	border: none !important;
      	outline: none !important;
      	box-shadow: none !important;
      }
      .findbar-textbox:not([status]) {
      	background-color: transparent !important;
      }
      .findbar-textbox:not(:focus, [status]):hover {
      	background-color: var(--toolbarbutton-field-background-color) !important;
      }

      label.found-matches {
      	position: absolute !important;
      	right: calc(100% - var(--textbox-width)) !important;
      	text-align: right !important;
      	margin: 0px !important;
      }

      .findbar-label:not(.found-matches) {
      	display: none !important;
      }

      .findbar-container > checkbox {
      	display: grid !important;
      	justify-items: center !important;
      	margin-left: 0px !important;
      	overflow: hidden !important;
      }
      .findbar-container > checkbox * {
      	display: none !important;
      }

      .findbar-highlight {
      	order: var(--highlight-all-position) !important;
      	width: calc(30px * var(--show-highlight-all)) !important;
      	height: calc(24px * var(--show-highlight-all)) !important;
      	margin-right: calc(4px * var(--show-highlight-all)) !important;
      }
      .findbar-case-sensitive {
      	order: var(--match-case-position) !important;
      	width: calc(30px * var(--show-match-case)) !important;
      	height: calc(24px * var(--show-match-case)) !important;
      	margin-right: calc(4px * var(--show-match-case)) !important;
      }
      .findbar-match-diacritics {
      	order: var(--match-diacritics-position) !important;
      	width: calc(30px * var(--show-match-diacritics)) !important;
      	height: calc(24px * var(--show-match-diacritics)) !important;
      	margin-right: calc(4px * var(--show-match-diacritics)) !important;
      }
      .findbar-entire-word {
      	order: var(--whole-words-position) !important;
      	width: calc(30px * var(--show-whole-words)) !important;
      	height: calc(24px * var(--show-whole-words)) !important;
      	margin-right: calc(4px * var(--show-whole-words)) !important;
      }
      .findbar-highlight::before {
      	content: "[ab]";
      	font-weight: bold;
      	color: var(--toolbar-color);
      }
      .findbar-case-sensitive::before {
      	content: "Aa";
      	font-weight: bold;
      	color: var(--toolbar-color);
      }
      .findbar-match-diacritics::before {
      	content: "àë";
      	font-weight: bold;
      	color: var(--toolbar-color);
      }
      .findbar-entire-word::before {
      	content: "ab";
      	font-weight: bold;
      	color: var(--toolbar-color);
      	grid-row: 1;
      	grid-column: 1;
      }
      .findbar-entire-word::after {
      	width: 1.3em;
      	height: 0.2em;
      	margin-bottom: -1em;
      	content: "";
      	border-left: 2px solid var(--toolbar-color);
      	border-right: 2px solid var(--toolbar-color);
      	border-bottom: 1px solid var(--toolbar-color);
      	grid-row: 1;
      	grid-column: 1;
      }

      .findbar-container > checkbox:not([checked]):hover {
      	background-color: var(--toolbarbutton-hover-background) !important;
      	border-radius: 4px !important;
      }
      .findbar-container > checkbox[checked] {
      	background-color: var(--toolbarbutton-active-background) !important;
      	border-radius: 4px !important;
      }

      .findbar-closebutton {
      	margin-left: calc(4px * var(--show-margin)) !important;
      }
    '';

  meta = {
    description = "Minimalistic, mouse-centered CSS theme for Firefox";
    homepage = "https://github.com/biglavis/LittleFox";
    license = lib.licenses.mit;
  };
}
