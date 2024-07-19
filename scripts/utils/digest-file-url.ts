export const digestFile = async (sourceDownload: URL) => {
    console.log(`Digest the source ${sourceDownload}`);

    const response = await fetch(sourceDownload);
    const buff = await response.arrayBuffer();

    const digest = await crypto.subtle.digest("sha256", buff);
    const digestHex = Array.from(new Uint8Array(digest), (e) =>
        e.toString(16).padStart(2, "0"),
    ).join("");

    return digestHex;
}