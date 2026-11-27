# DEEP Subtitle Archive

DEEP 영상의 YouTube 썸네일과 일본어·한국어 SRT 파일을 공개하는 비공식 커뮤니티 게시판입니다. 사이트 코드는 GitHub에, 서비스는 Cloudflare Workers에, 게시글 데이터는 D1에, 자막 파일은 R2에 보관합니다.

## Cloudflare 배포 준비

1. Cloudflare 계정에 로그인하여 Workers Builds에서 이 GitHub 저장소를 연결합니다. 빌드 명령은 `npm ci && npm run build`, 배포 명령은 `npx wrangler deploy`입니다. 아직 데이터베이스 설정 전에는 배포가 실패합니다.
2. D1 데이터베이스 `deepsubtitle-db`와 R2 버킷 `deepsubtitle-files`를 만듭니다. R2 이용 가능 여부와 요금제는 계정에서 확인해야 합니다.
3. Cloudflare가 발급한 D1 ID로 `wrangler.jsonc`의 `REPLACE_WITH_D1_DATABASE_ID`를 교체합니다.
4. D1에 `npx wrangler d1 migrations apply deepsubtitle-db --remote`로 초기 스키마를 적용합니다.
5. Worker 비밀 변수 `ADMIN_TOKEN`에 **무작위로 생성한 24자 이상의 긴 값**을 설정합니다. 예: `npx wrangler secret put ADMIN_TOKEN`. 이 값을 GitHub나 채팅에 올리지 마세요.
6. 사이트를 배포하고 관리자로 로그인해 영상과 SRT 파일을 등록합니다. 공개 이용자는 자막을 다운로드하고 수정 의견을 작성할 수 있습니다. 의견은 공개 표시됩니다.

Worker 관리자 비밀번호는 브라우저 메모리에만 저장되며 새로고침하면 다시 입력해야 합니다. Cloudflare WAF의 요청 제한과 Turnstile 등 추가 스팸 방지는 실제 공개 운영 전에 설정하는 것이 좋습니다. 댓글의 기본 제한은 동일 IP 기준 30초에 한 번이며, 강력한 스팸 방지를 대신하지 않습니다.

Cloudflare 계정의 권한이나 비용 설정에 따라 위 단계에서 추가 설정이 필요할 수 있습니다. ChatGPT Sites의 기존 D1/R2 데이터는 이 저장소로 자동 복사되지 않습니다.

## 로컬 빌드

`npm ci` 다음 `npm run build`. 전체 기능의 로컬 실행에는 Wrangler 및 D1/R2 바인딩과 로컬 비밀 설정이 필요합니다.

DEEP 로고는 공식 사이트의 이미지를 참조하며, 이 프로젝트는 공식 사이트를 사칭하지 않는 독립 커뮤니티입니다.

