const fosdem = /^https:\/\/.*fosdem\.org\/[0-9].+\/.*$/;
const github = /^https:\/\/github\.com\/.*\/.*$/;
const reddit = /^https:\/\/www\.reddit\.com\/r\/.*$/;
const rust_docs = /^https:\/\/doc\.rust-lang\.org\/.*$/;
const twitter = /^https:\/\/twitter\.com\/.*$/;
const youtube = /^https:\/\/youtu\.be\/.*$/;
const youtube_com = /^https:\/\/www\.youtube\.com.*$/;
const zig_docs = /^https:\/\/ziglang\.org\/.*$/;
const zig_news = /^https:\/\/zig\.news\/.*$/;

export const isFosdem = (s: string) => {
  if (s.match(fosdem)) {
    return true;
  } else {
    return false;
  }
};

export const isGitHub = (s: string) => {
  if (s.match(github)) {
    return true;
  } else {
    return false;
  }
};

export const isReddit = (s: string) => {
  if (s.match(reddit)) {
    return true;
  } else {
    return false;
  }
};

export const isRust = (s: string) => {
  if (s.match(rust_docs)) {
    return true;
  } else {
    return false;
  }
};

export const isTwitter = (s: string) => {
  if (s.match(twitter)) {
    return true;
  } else {
    return false;
  }
};

export const isYouTube = (s: string) => {
  if (s.match(youtube) || s.match(youtube_com)) {
    return true;
  } else {
    return false;
  }
};

export const isZig = (s: string) => {
  if (s.match(zig_docs) || s.match(zig_news)) {
    return true;
  } else {
    return false;
  }
};
