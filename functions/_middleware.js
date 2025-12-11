// Cloudflare Pages Functions middleware for www to non-www redirect
export async function onRequest(context) {
  const url = new URL(context.request.url);

  // Check if the request is for www subdomain
  if (url.hostname === 'www.anjieart.com') {
    // Redirect to non-www version with 301 (permanent)
    url.hostname = 'anjieart.com';
    return Response.redirect(url.toString(), 301);
  }

  // Continue to next middleware/page
  return context.next();
}
