# 업무 종합 현황 대시보드 (AI Business Dashboard)

기업 일반 행정업무 담당자를 위한 AI 기반 올인원 업무 대시보드입니다.

## 주요 기능

### 메인 대시보드
- **KPI 신호등** — 매출목표·프로젝트·CS처리율·팀효율 4종 실시간 표시
- **환율 위젯** — USD·EUR·JPY·CNY 등락 표시 (15초 갱신)
- **마일스톤 카운트다운** — D-Day + 진행률 바 + 지연 경고
- **우선순위 Todo** — AI 정렬, 완료 토글, 도넛 차트 연동
- **SWOT 분석** — 강점·약점·기회·위협 4분면 + 자동 경고
- **팀원 현황** — 가용 여부·업무량 게이지
- **캘린더 & 일정** — 월간 미니 캘린더 + 오늘 일정
- **핫이슈 트래커** — 업계·경쟁사·내부 이슈 태그 분류
- **Slack 채널** — 미읽음 수 표시

### AI 업무 챗봇 (Claude API)
대시보드 데이터 기반 Q&A 및 업무 지원

### AI 변호사 (한국법령 MCP)
- 한국법령정보원 DB 실시간 연동
- 법령 조항 자동 강조 표시
- 빠른 질문 버튼 (계약서 검토, 노무·해고, 행정심판 등)
- 대화 이력 유지 (멀티턴)
- MCP 서버: `https://korean-law-mcp.fly.dev/mcp`

### 법인카드 분석 (파일 업로드)
- 지원 파일: 이미지(JPG·PNG), PDF, Excel(xlsx·xls), CSV
- 월간 / 분기별 / 연간 분석
- 카테고리별 도넛 차트 + 월별 추이 라인 차트
- AI 인사이트 (경고·정보·팁 태그)
- AI 상담 챗봇 (분석 결과 기반 Q&A)

## 기술 스택

| 구성 | 기술 |
|------|------|
| 구조 | 단일 HTML 파일 (설치 불필요) |
| 차트 | Chart.js 4.4.1 |
| 엑셀 파싱 | SheetJS (xlsx) 0.18.5 |
| 아이콘 | Tabler Icons 3.19.0 |
| AI | Claude API (claude-sonnet-4-20250514) |
| 법령 | 한국법령 MCP Server |

## 시작하기

### 즉시 실행
```bash
# 저장소 클론
git clone https://github.com/jinyuzhu1216/aibusiness.git
cd aibusiness

# index.html을 브라우저로 열기
open index.html
```

### GitHub Pages 배포
1. 저장소 `Settings` → `Pages`
2. Branch: `main` / Folder: `/ (root)` 선택
3. `https://jinyuzhu1216.github.io/aibusiness` 접속

## API 설정

`index.html` 내 Claude API는 Anthropic API 키가 필요합니다.  
실제 배포 시 백엔드 프록시를 통해 API 키를 안전하게 관리하세요.

```
Claude API: https://api.anthropic.com/v1/messages
한국법령 MCP: https://korean-law-mcp.fly.dev/mcp?oc=021216
```

## 구현 현황

- [x] 1단계: KPI 신호등, Todo, 마일스톤, 캘린더, 핫이슈
- [x] 2단계: 환율 위젯, AI 챗봇, 법인카드 분석
- [x] 3단계: AI 변호사 (한국법령 MCP 연동)
- [ ] 4단계: Slack·메일 실시간 연동, 텔레그램 알림

## 라이선스

MIT License — 자세한 내용은 [LICENSE](LICENSE) 파일을 참고하세요.