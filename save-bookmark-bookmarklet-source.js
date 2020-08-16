(() => {
    const metaDescription = document.querySelector(`meta[name="description"]`);
    const prepend = `#  `;
    const colDelimeter = `  -  `;
    prompt(
        `Copy this`,
        `${prepend}
        ${document.title.replace(/\s+/g, ` `).trim()}
        ${colDelimeter}
        ${window.location}
        ${colDelimeter}
        ${metaDescription && metaDescription.content.replace(/\s+/g, ` `).trim()}
        ${colDelimeter}`
    );
})()
