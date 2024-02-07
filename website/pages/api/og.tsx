/* eslint-env node */
import { ImageResponse } from "@vercel/og";

export const config = {
  runtime: "edge",
};

const font = fetch(new URL("./Inter-SemiBold.otf", import.meta.url)).then(
  (res) => res.arrayBuffer()
);

export default async function (req) {
  const inter = await font;

  const { searchParams } = new URL(req.url);

  const hasTitle = searchParams.has("title");
  const title = hasTitle ? searchParams.get("title")?.slice(0, 100) : "Mix";

  return new ImageResponse(
    (
      <div
        style={{
          height: "100%",
          width: "100%",
          display: "flex",
          flexDirection: "column",
          alignItems: "flex-start",
          justifyContent: "center",
          padding: 80,
          backgroundColor: "#141316",
          backgroundImage:
            "radial-gradient(circle at 25px 25px, #333 2%, transparent 0%), radial-gradient(circle at 75px 75px, #333 2%, transparent 0%)",
          backgroundSize: "100px 100px",
          backgroundPosition: "-30px -10px",
          fontWeight: 600,
          color: "white",
        }}
      >
        <svg
          style={{ position: "absolute", top: 80, left: 80 }}
          width="267"
          height="140"
          viewBox="0 0 267 140"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
        >
          <path
            fill-rule="evenodd"
            clip-rule="evenodd"
            d="M75.6176 96.9316L33.7647 15.1645C30.2868 8.36977 21.9592 5.68096 15.1645 9.15887C8.36978 12.6368 5.68097 20.9644 9.15887 27.7591L51.0117 109.526C54.4896 116.321 62.8172 119.01 69.6119 115.532C76.4067 112.054 79.0955 103.726 75.6176 96.9316ZM14.1957 7.26611C6.35562 11.2791 3.25315 20.8878 7.26612 28.7279L49.119 110.495C53.1319 118.335 62.7407 121.438 70.5808 117.425C78.4208 113.412 81.5233 103.803 77.5103 95.9628L35.6575 14.1957C31.6445 6.35561 22.0357 3.25314 14.1957 7.26611Z"
            fill="#38FFC3"
          />
          <path
            fill-rule="evenodd"
            clip-rule="evenodd"
            d="M51.2594 96.9316L93.1122 15.1645C96.5901 8.36977 104.918 5.68096 111.712 9.15887C118.507 12.6368 121.196 20.9644 117.718 27.7591L75.8652 109.526C72.3873 116.321 64.0597 119.01 57.265 115.532C50.4703 112.054 47.7815 103.726 51.2594 96.9316ZM112.681 7.26611C120.521 11.2791 123.624 20.8878 119.611 28.7279L77.758 110.495C73.745 118.335 64.1362 121.438 56.2962 117.425C48.4561 113.412 45.3537 103.803 49.3666 95.9628L91.2195 14.1957C95.2324 6.35561 104.841 3.25314 112.681 7.26611Z"
            fill="#38FFC3"
          />
          <path
            fill-rule="evenodd"
            clip-rule="evenodd"
            d="M75.6176 43.0684L33.7647 124.836C30.2868 131.63 21.9592 134.319 15.1645 130.841C8.36978 127.363 5.68097 119.036 9.15887 112.241L51.0117 30.4738C54.4896 23.6791 62.8172 20.9903 69.6119 24.4682C76.4067 27.9461 79.0955 36.2737 75.6176 43.0684ZM14.1957 132.734C6.35562 128.721 3.25315 119.112 7.26612 111.272L49.119 29.505C53.1319 21.6649 62.7407 18.5625 70.5808 22.5754C78.4208 26.5884 81.5233 36.1972 77.5103 44.0372L35.6575 125.804C31.6445 133.644 22.0357 136.747 14.1957 132.734Z"
            fill="#38FFC3"
          />
          <path
            fill-rule="evenodd"
            clip-rule="evenodd"
            d="M51.2594 43.0684L93.1122 124.836C96.5901 131.63 104.918 134.319 111.712 130.841C118.507 127.363 121.196 119.036 117.718 112.241L75.8652 30.4738C72.3873 23.6791 64.0597 20.9903 57.265 24.4682C50.4703 27.9461 47.7815 36.2737 51.2594 43.0684ZM112.681 132.734C120.521 128.721 123.624 119.112 119.611 111.272L77.758 29.505C73.745 21.6649 64.1362 18.5625 56.2962 22.5754C48.4561 26.5884 45.3537 36.1972 49.3666 44.0372L91.2195 125.804C95.2324 133.644 104.841 136.747 112.681 132.734Z"
            fill="#38FFC3"
          />
          <path
            d="M232.445 93.5155L246.025 74.0555L234.055 56.6255H241.055L249.595 70.3455L258.205 56.6255H264.995L253.025 73.7755L266.605 93.5155H259.465L249.315 77.6955L239.165 93.5155H232.445Z"
            fill="#38FFC3"
          />
          <path
            d="M207.552 39.4062C208.859 39.4062 209.909 39.8029 210.702 40.5963C211.496 41.3429 211.892 42.3229 211.892 43.5363C211.892 44.7496 211.496 45.7529 210.702 46.5463C209.909 47.2929 208.859 47.6663 207.552 47.6663C206.292 47.6663 205.266 47.2929 204.472 46.5463C203.726 45.7529 203.352 44.7496 203.352 43.5363C203.352 42.3229 203.726 41.3429 204.472 40.5963C205.266 39.8029 206.292 39.4062 207.552 39.4062ZM212.242 88.8263H222.602V93.5163H195.022V88.8263H206.362V61.3163H195.372V56.6263H212.242V88.8263Z"
            fill="#38FFC3"
          />
          <path
            d="M175.87 55.8555C177.97 55.8555 179.673 56.6021 180.98 58.0955C182.333 59.5421 183.01 62.2021 183.01 66.0755V93.5155H177.62V67.0555C177.62 64.4888 177.457 62.7621 177.13 61.8755C176.803 60.9421 176.01 60.4755 174.75 60.4755C172.37 60.4755 170.223 61.9455 168.31 64.8855V93.5155H162.85V67.0555C162.85 64.4888 162.687 62.7621 162.36 61.8755C162.033 60.9421 161.24 60.4755 159.98 60.4755C157.6 60.4755 155.453 61.9455 153.54 64.8855V93.5155H148.15V56.6255H152.7L153.12 60.9655C154.24 59.3321 155.407 58.0721 156.62 57.1855C157.88 56.2988 159.373 55.8555 161.1 55.8555C164.553 55.8555 166.77 57.4888 167.75 60.7555C168.87 59.1688 170.06 57.9555 171.32 57.1155C172.58 56.2755 174.097 55.8555 175.87 55.8555Z"
            fill="#38FFC3"
          />
        </svg>

        <p
          style={{
            position: "absolute",
            bottom: 90,
            width: "80%",
            left: 80,
            margin: 0,
            fontSize: 34,
          }}
        >
          An expressive way to effortlessly build design systems in Flutter.
        </p>
        <h1
          style={
            {
              fontSize: 82,
              marginTop: 40,
              lineHeight: 1.1,
              textShadow: "0 2px 30px #000",
              backgroundImage: "linear-gradient(90deg, #fff 40%, #aaa)",
              backgroundClip: "text",
              "-webkit-background-clip": "text",
              color: "transparent",
            } as any
          }
        >
          {title}
        </h1>
      </div>
    ),
    {
      width: 1200,
      height: 630,
      fonts: [
        {
          name: "inter",
          data: inter,
          style: "normal",
        },
      ],
    }
  );
}
