require ["fileinto","imap4flags"];

if header :is "X-Spam" "Yes" {
  setflag "\\seen";
  fileinto "Spam";
}
