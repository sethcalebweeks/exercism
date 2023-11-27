function saddlepoints(M)
    [(r, c) for r in 1:size(M, 1), c in 1:size(M, 2) if M[r, c] === reduce(max, M[r, :]) && M[r, c] === reduce(min, M[:, c])]
end