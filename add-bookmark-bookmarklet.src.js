(() => {
    const metaDescription = document.querySelector(`meta[name="description"]`);
    const delimRepeat = 3;
    const delim = ` `;
    prompt(
        `Copy this`,
        `${document.title.replace(/\s+/g, ` `).trim()}
        ${delim.repeat(delimRepeat)}
        ${window.location}
        ${delim.repeat(delimRepeat)}
        ${metaDescription && metaDescription.content.replace(/\s+/g, ` `).trim()}
        ${delim.repeat(delimRepeat)}`
    );
})()
