#!/bin/bash

# ============================================================
#  AI Business Dashboard — GitHub 자동 배포 스크립트
#  사용법: bash deploy-script.sh "커밋 메시지"
#  예시:   bash deploy-script.sh "feat: 법인카드 분석 기능 추가"
# ============================================================

set -e  # 에러 발생 시 즉시 중단

# ── 설정 ────────────────────────────────────────────────────
REPO_URL="https://github.com/jinyuzhu1216/aibusiness.git"
BRANCH="main"
DEFAULT_MSG="chore: 대시보드 업데이트 $(date '+%Y-%m-%d %H:%M')"
COMMIT_MSG="${1:-$DEFAULT_MSG}"

# ── 색상 출력 ────────────────────────────────────────────────
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

info()    { echo -e "${GREEN}[INFO]${NC} $1"; }
warning() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error()   { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

# ── Git 설치 확인 ────────────────────────────────────────────
if ! command -v git &> /dev/null; then
  error "Git이 설치되어 있지 않습니다. https://git-scm.com 에서 설치 후 다시 시도하세요."
fi

info "배포 시작: $COMMIT_MSG"

# ── Git 초기화 (처음 실행 시) ───────────────────────────────
if [ ! -d ".git" ]; then
  info "Git 저장소 초기화 중..."
  git init
  git remote add origin "$REPO_URL"
  info "원격 저장소 연결 완료: $REPO_URL"
else
  info "기존 Git 저장소 감지됨"
  # 원격 저장소가 없으면 추가
  if ! git remote get-url origin &> /dev/null; then
    git remote add origin "$REPO_URL"
    info "원격 저장소 연결 완료"
  fi
fi

# ── 필수 파일 확인 ───────────────────────────────────────────
REQUIRED_FILES=("index.html" "README.md" "LICENSE.txt" ".gitignore.txt" "deploy-script.sh")
for f in "${REQUIRED_FILES[@]}"; do
  if [ ! -f "$f" ]; then
    warning "파일 없음: $f (계속 진행)"
  else
    info "파일 확인: $f ✓"
  fi
done

# ── 스테이징 & 커밋 ─────────────────────────────────────────
info "변경된 파일 스테이징 중..."
git add .

# 변경사항이 없으면 종료
if git diff --cached --quiet; then
  warning "변경된 파일이 없습니다. 배포를 건너뜁니다."
  exit 0
fi

git commit -m "$COMMIT_MSG"
info "커밋 완료: $COMMIT_MSG"

# ── 푸시 ────────────────────────────────────────────────────
info "GitHub에 푸시 중..."
git push -u origin "$BRANCH"

echo ""
echo -e "${GREEN}============================================${NC}"
echo -e "${GREEN}  배포 완료!${NC}"
echo -e "${GREEN}  저장소: ${REPO_URL}${NC}"
echo -e "${GREEN}  Pages:  https://jinyuzhu1216.github.io/aibusiness${NC}"
echo -e "${GREEN}============================================${NC}"
