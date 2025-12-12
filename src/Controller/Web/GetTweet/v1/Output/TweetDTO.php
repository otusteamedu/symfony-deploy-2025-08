<?php

namespace App\Controller\Web\GetTweet\v1\Output;

readonly class TweetDTO
{
    public function __construct(
        public int $id,
        public string $text,
        public string $author,
        public string $createdAt
    ) {
    }
}