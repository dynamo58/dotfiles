let stylesheet = document.createElement("style");

stylesheet.innerText = `
/* remove the SUBtember banner from Twitch */
.Layout-sc-1xcs6mc-0.eUMKkf.subtember-gradient {
  display: none !important;
}

/* remove Shorts section from YouTube subscriber feed */
ytd-rich-shelf-renderer[is-shorts=""] {
  display: none !important;
}
`;

document.head.appendChild(stylesheet);