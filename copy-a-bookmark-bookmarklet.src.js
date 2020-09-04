(() => {
    const metaKeywords = document.querySelector(`meta[name="keywords"]`);
    const title = document.title.replace(/\s+/g, ` `).trim();
    const prepend = `#  `;
    const colDelimeter = `  ~  `;
    prompt(
        `Copy this bookmark`,
        `${prepend}
        ${title.length > 0 ? title : window.location.hostname}
        ${colDelimeter}
        ${window.location}
        ${colDelimeter}
        ${metaKeywords ? metaKeywords.content.replace(/\s+/g, ` `).trim() : '-'}`
    );
})()
